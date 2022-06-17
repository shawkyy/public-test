// Created on 01.04.22. Copyright © 2022 Delivery Hero. All rights reserved.

import Foundation

struct ComponentsModel: Decodable {
  let components: [ComponentAPIModel]
}

enum JSONTestDecoderErrors: Error {
  case fileNotFound(filename: String)
}

enum JSONFile: String {
  // MARK: - Components files
  case accessibilityComponents = "accessibility-components"
  case homescreenComponents = "homescreen-components"
  case pagersComponents = "pagers-components"
  case rlpComponents = "rlp-components"
  case talabatComponents = "talabat-components"

  // MARK: - Templates files
  case pandoraTemplates = "pandora-templates"
  case talabatTemplates = "talabat-templates"
}
// Created on 01.04.22. Copyright © 2022 Delivery Hero. All rights reserved.

import Foundation

struct ComponentsModel: Decodable {
  let components: [ComponentAPIModel]
}

enum JSONTestDecoderErrors: Error {
  case fileNotFound(filename: String)
}

enum JSONFile: String {
  // MARK: - Components files
  case accessibilityComponents = "accessibility-components"
  case homescreenComponents = "homescreen-components"
  case pagersComponents = "pagers-components"
  case rlpComponents = "rlp-components"
  case talabatComponents = "talabat-components"

  // MARK: - Templates files
  case pandoraTemplates = "pandora-templates"
  case talabatTemplates = "talabat-templates"
}
// Created on 01.04.22. Copyright © 2022 Delivery Hero. All rights reserved.

import Foundation

struct ComponentsModel: Decodable {
  let components: [ComponentAPIModel]
}

enum JSONTestDecoderErrors: Error {
  case fileNotFound(filename: String)
}

enum JSONFile: String {
  // MARK: - Components files
  case accessibilityComponents = "accessibility-components"
  case homescreenComponents = "homescreen-components"
  case pagersComponents = "pagers-components"
  case rlpComponents = "rlp-components"
  case talabatComponents = "talabat-components"

  // MARK: - Templates files
  case pandoraTemplates = "pandora-templates"
  case talabatTemplates = "talabat-templates"
}
