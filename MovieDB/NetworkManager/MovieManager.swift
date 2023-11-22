//
//  MovieManager.swift
//  MovieDB
//
//  Created by Mehul Makwana on 22/11/23.
//

import Foundation

// MARK: - MovieManager
struct MovieManager: Codable {
  let page: Int?
  let results: [Movie]?
  let totalPages, totalResults: Int?
  
  enum CodingKeys: String, CodingKey {
    case page, results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}

// MARK: - Movies
struct Movie: Codable, Identifiable, Hashable {
  let adult: Bool?
  let backdropPath: String?
  let genreIDS: [Int]?
  let id: Int?
  let originalLanguage: String?
  let originalTitle, overview: String?
  let popularity: Double?
  let posterPath, releaseDate, title: String?
  let video: Bool?
  let voteAverage: Double?
  let voteCount: Int?
  
  var backgroundImage: String {
    "\(Constant.imageURL)\(backdropPath ?? "")"
  }
  
  var posterImage: String {
    "\(Constant.imageURL)\(posterPath ?? "")"
  }
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIDS = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview, popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}
