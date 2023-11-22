//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by Mehul Makwana on 22/11/23.
//

import SwiftUI

struct MovieDetailsView: View {
  let movieId: String
  @StateObject var movieViewModel = MovieViewModel()
  
  var body: some View {
    VStack {
      if movieViewModel.isLoading {
        ProgressView("Loading...")
      } else if let movie = movieViewModel.movieDetail {
        MovieItem(movie: movie)
      } else {
        Text(movieViewModel.networkError?.localizedDescription ?? "Something went wrong, please try again later")
          .foregroundStyle(.red)
      }
    }
    .task {
      if (movieViewModel.movieDetail != nil) {
        return
      }
      await movieViewModel.fetchMovieDetails(movieID: movieId)
    }
  }
}

#Preview {
  MovieDetailsView(movieId: "695721")
}

private struct MovieItem: View {
  let movie: MovieDetail
  
  var body: some View {
    VStack(alignment: .leading) {
      NetworkImage(imageURL: movie.backgroundImage)
      HStack {
        Text(movie.originalTitle ?? "")
          .font(.headline)
          .padding(16.0)
        Spacer()
      }
      Text(movie.overview ?? "")
        .font(.subheadline)
        .multilineTextAlignment(.leading)
        .padding(.horizontal, 16)
      Spacer()
    }
  }
}
