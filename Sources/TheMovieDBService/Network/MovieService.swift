//
//  MovieService.swift
//  TheMovieDB
//
//  Created by alfian on 04/07/24.
//

import Foundation
import Combine
import TheMovieDBCore

public protocol MovieService {
  func fetchNowMovies(from endpoint: MovieListEndpoint) -> AnyPublisher<Movies.ReturnType, Error>
  func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail.ReturnType, Error>
  func searchMovies(with query: String) -> AnyPublisher<Movies.ReturnType, Error>
}

public class MovieServiceImpl: MovieService {
  private let client: HTTPClient
  private let baseURL: String

  public init(client: HTTPClient, baseURL: String) {
    self.client = client
    self.baseURL = baseURL
  }

  public func fetchNowMovies(from endpoint: MovieListEndpoint) -> AnyPublisher<Movies.ReturnType, Error> {
    client
      .publisher(request: Movies(endpoint: endpoint).asURLRequest(baseURL: baseURL)!)
      .tryMap(DefaultDTOMapper.map)
      .eraseToAnyPublisher()
  }

  public func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail.ReturnType, Error> {
    client
      .publisher(request: MovieDetail(id: id).asURLRequest(baseURL: baseURL)!)
      .tryMap(DefaultDTOMapper.map)
      .eraseToAnyPublisher()
  }

  public func searchMovies(with query: String) -> AnyPublisher<Movies.ReturnType, Error> {
    client
      .publisher(request: SearchMovies(query: query).asURLRequest(baseURL: baseURL)!)
      .tryMap(DefaultDTOMapper.map)
      .eraseToAnyPublisher()
  }
}
