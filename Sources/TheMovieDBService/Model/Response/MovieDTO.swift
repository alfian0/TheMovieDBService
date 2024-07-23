//
//  MovieResponse.swift
//  TheMovieDB
//
//  Created by alfian on 04/07/24.
//

import Foundation

// MARK:
// For better naming convetion all API resmponse model will be use *DTO (Data Transfer Object)
public struct ListDTO<D: Codable>: Codable {
  public let results: [D]

  public init(results: [D]) {
    self.results = results
  }
}

public struct MovieDTO: Codable {
  public let id: Int?
  public let title: String?
  public let backdropPath: String?
  public let posterPath: String?
  public let overview: String?
  public let voteAverage: Double?
  public let voteCount: Int?
  public let runtime: Int?
  public let releaseDate: String?
  public let casts: CastsDTO?
  public let videos: ListDTO<VideosDTO>?

  public init(id: Int?,
              title: String?,
              backdropPath: String?,
              posterPath: String?,
              overview: String?,
              voteAverage: Double?,
              voteCount: Int?,
              runtime: Int?,
              releaseDate: String?,
              casts: CastsDTO?,
              videos: ListDTO<VideosDTO>?) {
    self.id = id
    self.title = title
    self.backdropPath = backdropPath
    self.posterPath = posterPath
    self.overview = overview
    self.voteAverage = voteAverage
    self.voteCount = voteCount
    self.runtime = runtime
    self.releaseDate = releaseDate
    self.casts = casts
    self.videos = videos
  }
}

public struct CastsDTO: Codable {
  public let cast: [CastDTO]

  public init(cast: [CastDTO]) {
    self.cast = cast
  }
}

public struct CastDTO: Codable {
  public let id: Int?
  public let name: String?
  public let profilePath: String?

  public init(id: Int?, name: String?, profilePath: String?) {
    self.id = id
    self.name = name
    self.profilePath = profilePath
  }
}

public struct VideosDTO: Codable {
  public let id: String?
  public let site: String?
  public let key: String?
  public let type: String?

  public init(id: String?, site: String?, key: String?, type: String?) {
    self.id = id
    self.site = site
    self.key = key
    self.type = type
  }
}
