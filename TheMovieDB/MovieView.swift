//
//  MovieView.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieView: View {
    var movie: Movies
    var body: some View {
        HStack {
            Spacer()
            WebImage(url: (movie.imageFullURLComputedProperty ?? URL(string: "")))
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            VStack(spacing: 5){
                Text("Title: " + movie.title)
                    .multilineTextAlignment(.leading)
                Text("Release Date: " + movie.releaseDate)
                    .multilineTextAlignment(.leading)
                Text("Rating: " + String(movie.voteAverage))
                    .multilineTextAlignment(.leading)
            }.padding()
            Spacer()
        }.background(Color.blue)
            .cornerRadius(20)
            .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movies(id: UUID(), idMovie: 1, title: "John Doe", releaseDate: "1/1/01", voteAverage: 99, backDropPath: "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg", overview: "Bah"))
    }
}
