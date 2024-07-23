//
//  File.swift
//  
//
//  Created by alfian on 23/07/24.
//

import Foundation
import TheMovieDBCore

public extension Bundle {
  static var theMovieDBService: Bundle = .module
  
  func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D {
    guard let url = self.url(forResource: filename, withExtension: "json") else {
      throw NSError(domain: "FileNotFound",
                    code: 404,
                    userInfo: [NSLocalizedDescriptionKey: "File \(filename).json not found in bundle."])
    }
    let data = try Data(contentsOf: url)
    let jsonDecoder = Utils.jsonDecoder
    let decodeModel = try jsonDecoder.decode(D.self, from: data)
    return decodeModel
  }
}
