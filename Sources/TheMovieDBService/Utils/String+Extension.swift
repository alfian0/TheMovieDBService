//
//  File.swift
//  
//
//  Created by alfian on 23/07/24.
//

import Foundation

public extension String {
  func localized() -> String {
    return NSLocalizedString(self, tableName: "Localizable", bundle: .module, value: self, comment: self)
  }
}
