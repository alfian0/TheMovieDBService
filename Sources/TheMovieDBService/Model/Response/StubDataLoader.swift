//
//  MovieResponse+Stub.swift
//  TheMovieDB
//
//  Created by alfian on 04/07/24.
//

import Foundation
import CoreData
import TheMovieDBCore

public class StubDataLoader {
  public static func loadStubMovies() -> [MovieDTO] {
    do {
      let response: ListDTO<MovieDTO> = try Bundle.main.loadAndDecodeJSON(filename: "now_playing")
      return response.results
    } catch {
      print("Failed to load and decode JSON: \(error.localizedDescription)")
      return []
    }
  }

  public static func loadStubMovie() -> MovieDTO? {
    do {
      let response: MovieDTO = try Bundle.main.loadAndDecodeJSON(filename: "movie_detail")
      return response
    } catch {
      print("Failed to load and decode JSON: \(error.localizedDescription)")
      return nil
    }
  }
}

public extension Bundle {
  static var theMovieDBService: Bundle = .module
}
