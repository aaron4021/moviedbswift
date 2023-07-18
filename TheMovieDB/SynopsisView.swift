//
//  SwiftUIView.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SynopsisView: View {
    var movie: Movies
    var body: some View {
        
        VStack {
            Text(movie.title + " details")
                .fontWeight(.bold)
                .padding()
                .font(.title2)
            WebImage(url: (movie.imageFullURLComputedProperty ?? ""))                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(movie.overview)
                .padding()
                .font(.body)
            Spacer()
            
        }.onAppear {
            print(movie.imageFullURL)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SynopsisView(movie: Movies(id: UUID(), idMovie: 1, title: "John Doe", releaseDate: "1/1/01", voteAverage: 99, backDropPath: "apple", overview: "BlahBlah"))
    }
}
