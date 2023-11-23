//
//  NetworkImage.swift
//  MovieDB
//
//  Created by Mehul Makwana on 23/11/23.
//

import SwiftUI
import NukeUI

struct NetworkImage: View {
  let imageURL: String?
  
  var body: some View {
    
    if let imageURL,
       let url = URL(string: imageURL) {
      LazyImage(url: url) { state in
        if let image = state.image {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        } else if state.error != nil {
          Color.red // Indicates an error
        } else {
          Color.blue // Acts as a placeholder
        }
      }
    } else {
      Image(systemName: "photo")
    }
    
  }
  
}

#Preview {
  NetworkImage(imageURL: "")
}
