//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Intern on 11/07/23.
//

import SwiftUI
struct ContentView: View {
    @StateObject var viewModel = MovieViewModel()
    @State var currentPage: Int = 0
    var body: some View {
        
        NavigationView{
            VStack{
                List(0..<viewModel.movieData.count) { movies in
                    NavigationLink {
                        SynopsisView(sampleMovie: viewModel.movieData[movies])
                    } label: {
                        MovieView(sampleMovie: viewModel.movieData[movies])
                    }.navigationTitle("Page " + "\(viewModel.currentPage): ")
                }.listStyle(.plain)
                
                Spacer()
                HorizontalScrollView(currentPage: $currentPage, count: 20)
            }
        }.onChange(of: currentPage) { page in
            viewModel.currentPage = page
            viewModel.loadMovies()
        }.onAppear {
            viewModel.loadMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
