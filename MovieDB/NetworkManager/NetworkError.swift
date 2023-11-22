//
//  NetworkError.swift
//  MovieDB
//
//  Created by Mehul Makwana on 22/11/23.
//

import Foundation

enum NetworkError: LocalizedError {
  case badURL
  case badStatusCode
  case decodingError
  case unspecifiedError
  case noData
  
  var errorDescription: String? {
    switch self {
    case .badURL:
      NSLocalizedString("URL is incorrect", comment: "")
    default:
      NSLocalizedString("Something went wrong, please try again later", comment: "")
    }
  }
}
