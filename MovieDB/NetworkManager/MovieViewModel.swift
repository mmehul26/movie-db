//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Mehul Makwana on 22/11/23.
//

import Foundation

@MainActor
class MovieViewModel: ObservableObject {
  @Published var movies: [Movie]?
  @Published var movieDetail: MovieDetail?
  @Published var isLoading: Bool = false
  @Published var networkError: NetworkError?
    
  private let headers = [
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjVmNTM5MzBjMDEyZThmZTY0ZjRkYjhlZGU4MWJiNCIsInN1YiI6IjY1NWRjZTJlN2YyZDRhMDBjOTdhMzhiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ggc-MLB8iU_M-Jk62TFDHrnGlB902yKX4wUqtgC9Kbw"
  ]
  
  func fetchMovies(page: Int = 1) async {
    
    defer {
      isLoading = false
    }
    
    guard let url = URL(string: "\(Constant.hostName)popular?language=en-US&page=\(page)") else {
      networkError = .badURL
      return
    }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    isLoading = true
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else {
        networkError = .badStatusCode
        return
      }
      
      movies = try JSONDecoder().decode(MovieManager.self, from: data).results

    } catch {
      networkError = .unspecifiedError
    }
    
  }
  
  func fetchMovieDetails(movieID: String) async {
    
    defer {
      isLoading = false
    }
    
    guard let url = URL(string: "\(Constant.hostName)\(movieID)?language=en-US") else {
      networkError = .badURL
      return
    }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    isLoading = true
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else {
        networkError = .badStatusCode
        return
      }
      
      movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
      
    } catch {
      networkError = .unspecifiedError
    }
  }

}
