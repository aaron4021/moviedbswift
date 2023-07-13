//
//  DummyDataSource.swift
//  TheMovieDB
//
//  Created by Intern on 13/07/23.
//

import Foundation



class DummyDataSource {
    func loadMovies(page: Int) -> [Movies] {
        if page == 1 {
            return [Movies(id: 1, title: "John Doe", releaseDate: "1/1/01", rating: 99, img: "apple", synopsis: "BlahBlah"), Movies(id: 2, title: "Jamie Fox", releaseDate: "1/2/03", rating: 99, img: "apple", synopsis: "Blah")]
        } else {
            return [Movies(id: 3, title: "Nonagon", releaseDate: "1/1/01", rating: 99, img: "cherry", synopsis: "Clah Clah"), Movies(id: 2, title: "Jamie Fox", releaseDate: "1/2/03", rating: 99, img: "star", synopsis: "Clah")]
        }
    }
}
