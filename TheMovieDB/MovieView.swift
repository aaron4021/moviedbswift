//
//  MovieView.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI

struct MovieView: View {
    var sampleMovie: Movies
    var body: some View {
        HStack {
            Spacer()
            Image(sampleMovie.img)
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
            Spacer()
            VStack{
                Text("Title: " + sampleMovie.title)
                Text("Release Date: " + sampleMovie.releaseDate)
                Text("Rating: " + String(sampleMovie.rating))
            }
            Spacer()
        }.background(Color.blue)
            .cornerRadius(20)
            .padding()
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(sampleMovie: Movies(id: 1, title: "John Doe", releaseDate: "1/1/01", rating: 99, img: "apple", synopsis: "Bah"))
    }
}
