//
//  MovieViewModel.swift
//  TheMovieDB
//
//  Created by Intern on 13/07/23.
//

import Foundation
import SwiftUI

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
    func loadMovies() {
        networkDataSource.getPopularMovies(page: currentPage) { [weak self] queryResult in
            guard var movieData = queryResult?.results else {
                return
            }
            self?.movieData = movieData
        }
    }
}
