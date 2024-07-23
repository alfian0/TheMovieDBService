//
//  File.swift
//  
//
//  Created by alfian on 23/07/24.
//

import Foundation

public extension String {
    func localized() -> String {
        let path = Bundle.theMovieDBService.path(forResource: Locale.current.languageCode, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
    }
}
