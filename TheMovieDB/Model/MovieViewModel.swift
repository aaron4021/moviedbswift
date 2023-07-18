//
//  MovieViewModel.swift
//  TheMovieDB
//
//  Created by Intern on 13/07/23.
//

import Foundation

protocol MovieViewModelProtocol: ObservableObject {
    func loadMovies()
    var currentPage: Int { get set }
    var movieData: [Movies] { get }
}

class MovieViewModel: MovieViewModelProtocol {
    @Published var currentPage = 1
    @Published var movieData: [Movies] = [Movies]()
    var networkDataSource: MovieDataSourceProtocol
    init(networkDataSource: MovieDataSourceProtocol = MovieDataSource()){
        self.networkDataSource = networkDataSource
    }
    //let dataSource = DummyDataSource()
    func loadMovies() {
       //movieData = dataSource.loadMovies(page: currentPage)
        networkDataSource.getPopularMovies(page: currentPage) { queryResult in
            guard let movieData = queryResult?.results else {
                return
            }
            self.movieData = movieData
        }
    }
}
