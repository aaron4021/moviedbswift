//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Intern on 11/07/23.
//

import SwiftUI
struct ContentView<T : MovieViewModelProtocol>: View {
    @StateObject var viewModel: T
    @State var currentPage: Int = 0
    var body: some View {
        
        NavigationView{
            VStack{
                List {
                    ForEach(viewModel.movieData) { movies in
                        NavigationLink {
                            SynopsisView(movie: movies)
                        } label: {
                            MovieView(movie: movies)
                        }.navigationTitle("Page " + "\(viewModel.currentPage): ")
                    }
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView<<#T: MovieViewModelProtocol#>>()
//    }
//}
