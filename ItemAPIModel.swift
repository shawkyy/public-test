//
// Created on 25.06.21. Copyright © 2022 Delivery Hero. All rights reserved.

import Fluid
import Foundation

public struct ItemAPIModel: Codable {
  public let id: String
  public let templateId: String
  public let templateHash: String
  public let position: Int?
  public let properties: ContentDataDictionary
  public let metadata: ContentDataDictionary?

  private enum CodingKeys: String, CodingKey {
    case id
    case templateId = "template_id"
    case templateHash = "template_hash"
    case position
    case properties
    case metadata
  }
}
