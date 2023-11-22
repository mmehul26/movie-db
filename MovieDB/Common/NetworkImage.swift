//
//  NetworkImage.swift
//  MovieDB
//
//  Created by Mehul Makwana on 23/11/23.
//

import SwiftUI

struct NetworkImage: View {
  let imageURL: String?
  
  var body: some View {
    
    if let imageURL,
       let url = URL(string: imageURL) {
      AsyncImage(url: url, content: { image in
        image
          .resizable()
          .scaledToFit()
      }, placeholder: {
        ProgressView()
      })
    } else {
      Image(systemName: "photo")
    }
    
  }
  
}

#Preview {
  NetworkImage(imageURL: "")
}
