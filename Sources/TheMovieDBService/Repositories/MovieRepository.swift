//
//  MovieRepository.swift
//  TheMovieDB
//
//  Created by alfian on 04/07/24.
//

import Foundation
import Combine

public protocol MovieRepository {
  func getNowPlayingMovies() -> AnyPublisher<[MovieDTO], Error>
  func getTopRatedMovies() -> AnyPublisher<[MovieDTO], Error>
  func getUpcomingMovies() -> AnyPublisher<[MovieDTO], Error>
  func getMovieDetail(id: Int) -> AnyPublisher<MovieDTO, Error>
  func searchMovies(with query: String) -> AnyPublisher<[MovieDTO], Error>
  func getFavorites() -> AnyPublisher<[FavoriteEntity], Error>
  func addFavorite(id: Int, title: String, overview: String) -> AnyPublisher<[FavoriteEntity], Error>
  func deleteFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error>
}

public class MovieRepositoryImpl: MovieRepository {
  private var movieService: MovieService
  private var favoriteService: FavoriteService

  public init(movieService: MovieService, favoriteService: FavoriteService) {
    self.movieService = movieService
    self.favoriteService = favoriteService
  }

  public func getNowPlayingMovies() -> AnyPublisher<[MovieDTO], Error> {
    movieService.fetchNowMovies(from: .nowPlaying)
      .map({ $0.results })
      .eraseToAnyPublisher()
  }

  public func getTopRatedMovies() -> AnyPublisher<[MovieDTO], Error> {
    movieService.fetchNowMovies(from: .topRated)
      .map({ $0.results })
      .eraseToAnyPublisher()
  }

  public func getUpcomingMovies() -> AnyPublisher<[MovieDTO], Error> {
    movieService.fetchNowMovies(from: .upcoming)
      .map({ $0.results })
      .eraseToAnyPublisher()
  }

  public func getMovieDetail(id: Int) -> AnyPublisher<MovieDTO, Error> {
    movieService.fetchMovieDetail(id: id)
      .eraseToAnyPublisher()
  }

  public func searchMovies(with query: String) -> AnyPublisher<[MovieDTO], Error> {
    movieService.searchMovies(with: query)
      .map({ $0.results })
      .eraseToAnyPublisher()
  }

  public func getFavorites() -> AnyPublisher<[FavoriteEntity], Error> {
    favoriteService.fetchFavorites()
  }

  public func addFavorite(id: Int, title: String, overview: String) -> AnyPublisher<[FavoriteEntity], Error> {
    favoriteService.getFavorite(id: id)
      .filter({ $0.count == 0 })
      .flatMap { _ in
        return self.favoriteService.addFavorite(id: id, title: title, overview: overview)
      }
      .eraseToAnyPublisher()
  }

  public func deleteFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error> {
    favoriteService.deleteFavorite(id: id)
  }
}
