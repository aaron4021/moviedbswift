//
//  MovieModel.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI

struct Movies: Identifiable {
    var id: Int
    var title: String
    var releaseDate: String
    var rating: Int
    var img: String
    var synopsis: String
}
