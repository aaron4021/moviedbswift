//
//  MovieViewModel.swift
//  TheMovieDB
//
//  Created by Intern on 13/07/23.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var currentPage = 1
    @Published var movieData: [Movies] = [Movies]()
    let dataSource = DummyDataSource()
    func loadMovies() {
       movieData = dataSource.loadMovies(page: currentPage)
    }
}
