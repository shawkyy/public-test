// Created on 25.06.21. Copyright © 2022 Delivery Hero. All rights reserved.

import Fluid
import UIKit

enum ComponentDomainModelType: String {
  case horizontalGrid = "scrollable-list"
  case verticalGrid = "grid"
}

struct ComponentDomainModel {
  var id: String
  var position: Int
  var properties: ContentDataDictionary
  var metadata: ContentDataDictionary
  var collectionCellModels: [CollectionCellModel]
  var template: Template

  var collectionContentData: CollectionContentData {
    CollectionContentData(
      properties: properties,
      metadata: metadata,
      cellModels: collectionCellModels
    )
  }

  init?(component: ComponentAPIModel, templates: [String: Template], host: FluidHosting?) {
    guard let componentTemplate = templates[component.templateId] else {
      return nil
    }

    self.id = component.id
    self.position = component.position ?? 0
    self.properties = component.properties
    self.metadata = component.metadata ?? [:]
    self.properties[.id] = PropertyWrapper.string(component.id) // this workaround should be removed asap
    let templateType = ComponentDomainModelType(rawValue: component.type ?? "") ?? .none

    let numberOfRows = component.properties[.rows]?.intValue ?? 1
    let items = component.items ?? []
    self.collectionCellModels = items.compactMap {
      guard let template = templates[$0.templateId] else { return nil }
      var itemProperties = $0.properties
      itemProperties[.id] = .string($0.id)
      let data = ContentData(properties: itemProperties, metadata: $0.metadata)
      var cellModel = CollectionCellModel(template: template, data: data, host: host)
      if templateType == .horizontalGrid {
        cellModel.cellHeight = CGFloat(1.0 / Double(numberOfRows))
      }
      return cellModel
    }

    if templateType == .horizontalGrid {
      let itemSpacing: Int = component.properties[.itemSpacing]?.intValue ?? 0
      let height = ComponentDomainModel.calculateHorizontalGridHeight(
        items: items,
        numberOfRows: numberOfRows,
        itemSpacing: itemSpacing
      )
      properties[.height] = .int(height)
    }
    self.template = componentTemplate
  }

  private static func calculateHorizontalGridHeight(
    items: [ItemAPIModel],
    numberOfRows: Int,
    itemSpacing: Int
  ) -> Int {
    var maxItemHeight = 0
    items.forEach {
      if let itemHeight = $0.properties[.height]?.intValue {
        if maxItemHeight < itemHeight {
          maxItemHeight = itemHeight
        }
      }
    }
    return numberOfRows * maxItemHeight + (numberOfRows - 1) * itemSpacing
  }
}

private extension String {
  static let id = "id"
  static let itemSpacing = "item_spacing"
  static let height = "height"
  static let rows = "rows"
}
