//
//  MovieService.swift
//  TheMovieDB
//
//  Created by Intern on 14/07/23.
//

import Foundation

protocol MovieDataSourceProtocol {
    func getPopularMovies(page: Int, completion: @escaping (QueryResult?) -> Void)
}

let AUTH: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjNiMTg2NzRmZjlmNzAzYjVlYjU3NjcyYmFmZDljMiIsInN1YiI6IjY0OGFhOTdiMjYzNDYyMDBjYTE4Nzk4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tQgyjS495o4qqwycv2DYovgi544ubIwy6ZtujaiqWok"
class MovieDataSource: MovieDataSourceProtocol {
    
    //@Published var pageResults: QueryResult = QueryResult(page: 0, results: [])
    func getPopularMovies(page: Int, completion: @escaping (QueryResult?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(page)") else {
        return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(AUTH)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data  = data, error == nil else {
                print("bla")
                return
            }
            do {
                let pageResults = try JSONDecoder().decode(QueryResult.self,from: data)
                DispatchQueue.main.async {
                    completion(pageResults)
                }
            } catch {
                print(error)
                completion(nil)
            }

        }
        task.resume()
        
    }
    
}

class MovieDataSourceGraphQL: MovieDataSourceProtocol {
    func getPopularMovies(page: Int, completion: @escaping (QueryResult?) -> Void) {
        completion(nil)
    }
    
    
}
