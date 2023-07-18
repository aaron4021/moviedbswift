//
//  PageModel.swift
//  TheMovieDB
//
//  Created by Intern on 14/07/23.
//

import Foundation

struct QueryResult: Hashable, Codable  {
    
    var page: Int
    var results: [Movies]
}
