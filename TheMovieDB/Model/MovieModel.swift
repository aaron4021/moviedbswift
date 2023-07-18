//
//  MovieModel.swift
//  TheMovieDB
//
//  Created by Intern on 12/07/23.
//

import SwiftUI

struct Movies: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var idMovie: Int
    var title: String
    var releaseDate: String
    var voteAverage: Double
    var backDropPath: String?
    var overview: String
    var imageFullURLComputedProperty: URL? {
        return URL(string: baseImgURL + (backDropPath ?? ""))
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backDropPath = "backdrop_path"
        case overview = "overview"
        case idMovie = "id"
    }
}
