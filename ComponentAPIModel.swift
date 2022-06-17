// Created on 25.06.21. Copyright © 2022 Delivery Hero. All rights reserved.

import Fluid
import Foundation

struct ComponentAPIModel: Codable {
  var id: String
  var position: Int?
  var items: [ItemAPIModel]?
  var type: String?
  var properties: ContentDataDictionary
  var metadata: ContentDataDictionary?
  var templateId: String
  var templateHash: String

  private enum CodingKeys: String, CodingKey {
    case id
    case position
    case items
    case properties
    case metadata
    case type = "layout_type"
    case templateId = "template_id"
    case templateHash = "template_hash"
  }
}
