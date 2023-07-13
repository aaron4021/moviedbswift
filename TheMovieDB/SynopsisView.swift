//
//  SwiftUIView.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI

struct SynopsisView: View {
    var sampleMovie: Movies
    var body: some View {
        
        VStack {
            Text(sampleMovie.title + " details")
                .fontWeight(.bold)
                .padding()
                .font(.title2)
            Image(sampleMovie.img)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(sampleMovie.synopsis)
                .padding()
                .font(.body)
            Spacer()
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SynopsisView(sampleMovie: Movies(id: 1, title: "John Doe", releaseDate: "1/1/01", rating: 99, img: "apple", synopsis: "BlahBlah"))
    }
}
