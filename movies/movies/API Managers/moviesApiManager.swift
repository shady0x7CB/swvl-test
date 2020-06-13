//
//  moviesApiManager.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

protocol MoviesAPIManagerProtocol {
    func readMoviesFromFile(completionBlock: @escaping (_ movies: [Movie], _ error: Error?) -> Void)
}

class MoviesAPIManager: MoviesAPIManagerProtocol{
    
    ///load movies list from local file
    func readMoviesFromFile(completionBlock: @escaping ([Movie], Error?) -> Void) {
        if let path = Bundle.main.path(forResource: AppConstants.moviesPath, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let moviesList = jsonResult[AppConstants.LocalFileKeys.movies.rawValue] as? [[String: Any]] {
                    let movies = moviesList.map { (movie) in
                        return Movie(dictionary: movie)
                    }
                    completionBlock(movies, nil)
                  }
              } catch {
                   completionBlock([], error)
              }
        }
    }
    
    
}
