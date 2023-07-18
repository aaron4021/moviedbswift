//
//  SwiftUIView.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SynopsisView: View {
    var sampleMovie: Movies
    var body: some View {
        
        VStack {
            Text(sampleMovie.title + " details")
                .fontWeight(.bold)
                .padding()
                .font(.title2)
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/original" + (sampleMovie.backDropPath ?? "apple")))
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(sampleMovie.overview)
                .padding()
                .font(.body)
            Spacer()
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SynopsisView(sampleMovie: Movies(id: UUID(), idMovie: 1, title: "John Doe", releaseDate: "1/1/01", voteAverage: 99, backDropPath: "apple", overview: "BlahBlah"))
    }
}
