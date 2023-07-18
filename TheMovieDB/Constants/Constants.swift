//
//  Constants.swift
//  TheMovieDB
//
//  Created by Intern on 18/07/23.
//

import Foundation

let baseImgURL: String = "https://image.tmdb.org/t/p/original"

enum Constants {
    static let Auth: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjNiMTg2NzRmZjlmNzAzYjVlYjU3NjcyYmFmZDljMiIsInN1YiI6IjY0OGFhOTdiMjYzNDYyMDBjYTE4Nzk4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tQgyjS495o4qqwycv2DYovgi544ubIwy6ZtujaiqWok"
}

enum MovieURL {
    case home
    case popular(page: Int, language: String = "en-US")
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .home:
            return "/"
        case .popular:
            return "/3/movie/popular"
        }
    }
    
    var queryItems: [URLQueryItem]?{
        switch self {
        case .popular(let page, let language):
            var queryItems = [URLQueryItem]()
            queryItems.append(URLQueryItem(name: "language", value: "\(language)"))
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            return queryItems
        default:
            return nil
        }
    }
    
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}


    
