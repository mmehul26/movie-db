//
//  ContentView.swift
//  MovieDB
//
//  Created by Mehul Makwana on 22/11/23.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var movieViewModel = MovieViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        if movieViewModel.isLoading {
          ProgressView("Loading...")
        } else if let movies = movieViewModel.movies,
                  !movies.isEmpty {
          MovieListItemView(movies: movies)
        } else {
          Text(movieViewModel.networkError?.localizedDescription ?? "Something went wrong, please try again later")
            .foregroundStyle(.red)
        }
      }
      .task {
        if ((movieViewModel.movies?.isEmpty) != nil) {
          return
        }
        await movieViewModel.fetchMovies()
      }
      .navigationTitle(movieViewModel.isLoading ? "" : "The Movie DB")
    }
  }
}

#Preview {
  ContentView()
}

private struct MovieListItemView: View {
  let movies: [Movie]
  
  var body: some View {
    List(movies) { movie in
      NavigationLink(value: "\(movie.id ?? 0)") {
        HStack {
          NetworkImage(imageURL: movie.posterImage)
            .cornerRadius(8.0)
            .frame(width: 120, height: 150)
          Text(movie.originalTitle ?? "")
            .multilineTextAlignment(.leading)
            .lineLimit(4)
        }
      }
    }
    .navigationDestination(for: String.self, destination: { movieId in
      MovieDetailsView(movieId: movieId)
    })
  }
}
