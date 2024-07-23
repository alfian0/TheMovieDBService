//
//  FavoriteService.swift
//  TheMovieDB
//
//  Created by alfian on 10/07/24.
//

import Combine
import TheMovieDBCore

public protocol FavoriteService {
  func fetchFavorites() -> AnyPublisher<[FavoriteEntity], Error>
  func getFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error>
  func addFavorite(id: Int, title: String, overview: String) -> AnyPublisher<[FavoriteEntity], Error>
  func deleteFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error>
}

public final class FavoriteServiceImp: FavoriteService {
  private let client: CoreDataClient

  public init(with client: CoreDataClient) {
    self.client = client
  }

  public func fetchFavorites() -> AnyPublisher<[FavoriteEntity], Error> {
    self.client.fetchRequest(FavoriteEntity.self)
  }

  public func getFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error> {
    self.client.fetchRequest(FavoriteEntity.self, predicate: ["id": id])
  }

  public func addFavorite(id: Int, title: String, overview: String) -> AnyPublisher<[FavoriteEntity], Error> {
    self.client.add(FavoriteEntity.self) { context in
      let newFavorite = FavoriteEntity(context: context)
      newFavorite.id = Int32(id)
      newFavorite.title = title
      newFavorite.overview = overview
    }
  }

  public func deleteFavorite(id: Int) -> AnyPublisher<[FavoriteEntity], Error> {
    self.client.delete(FavoriteEntity.self, predicate: ["id": id])
  }
}
