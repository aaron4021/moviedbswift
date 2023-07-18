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


class MovieDataSource: MovieDataSourceProtocol {
    func getPopularMovies(page: Int, completion: @escaping (QueryResult?) -> Void) {
        guard let url = MovieURL.popular(page: page).url else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer " + Constants.Auth, forHTTPHeaderField: "Authorization")
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
