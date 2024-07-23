//
//  APIRouter.swift
//  TheMovieDB
//
//  Created by alfian on 05/07/24.
//

import Foundation
import TheMovieDBCore

public struct MovieDetail: Request {
  public typealias ReturnType = MovieDTO
  public var path: String
  public var queryParams: [String: Any]?

  init(id: Int) {
    self.path = "/movie/\(id)"
    self.queryParams = [
      "append_to_response": "casts,videos"
    ]
  }
}

public struct Movies: Request {
  public typealias ReturnType = ListDTO<MovieDTO>
  public var path: String

  init(endpoint: MovieListEndpoint) {
    self.path = "/movie/\(endpoint.rawValue)"
  }
}

public struct SearchMovies: Request {
  public typealias ReturnType = ListDTO<MovieDTO>
  public var path: String
  public var queryParams: [String: Any]?

  init(query: String) {
    self.path = "/search/movie"
    self.queryParams = [
      "query": query
    ]
  }
}
