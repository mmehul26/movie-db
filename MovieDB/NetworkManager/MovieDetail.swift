//
//  MovieDetail.swift
//  MovieDB
//
//  Created by Mehul Makwana on 23/11/23.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
  let adult: Bool?
  let backdropPath: String?
  let belongsToCollection: String?
  let budget: Int?
  let genres: [Genre]?
  let homepage: String?
  let id: Int?
  let imdbID, originalLanguage, originalTitle, overview: String?
  let popularity: Double?
  let posterPath: String?
  let productionCompanies: [ProductionCompany]?
  let productionCountries: [ProductionCountry]?
  let releaseDate: String?
  let revenue, runtime: Int?
  let spokenLanguages: [SpokenLanguage]?
  let status, tagline, title: String?
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
    case belongsToCollection = "belongs_to_collection"
    case budget, genres, homepage, id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview, popularity
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue, runtime
    case spokenLanguages = "spoken_languages"
    case status, tagline, title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}

// MARK: - Genre
struct Genre: Codable {
  let id: Int?
  let name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
  let id: Int?
  let logoPath: String?
  let name, originCountry: String?
  
  enum CodingKeys: String, CodingKey {
    case id
    case logoPath = "logo_path"
    case name
    case originCountry = "origin_country"
  }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
  let iso31661, name: String?
  
  enum CodingKeys: String, CodingKey {
    case iso31661 = "iso_3166_1"
    case name
  }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
  let englishName, iso6391, name: String?
  
  enum CodingKeys: String, CodingKey {
    case englishName = "english_name"
    case iso6391 = "iso_639_1"
    case name
  }
}
