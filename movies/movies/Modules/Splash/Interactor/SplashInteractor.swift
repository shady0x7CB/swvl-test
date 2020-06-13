//
//  SplashInteractor.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class SplashInteractor: SplashInteractorProtocol{
    
    weak var presenter: SplashPresenterProtocol?
    var apiManager: MoviesAPIManagerProtocol?
    
    init(apiManager: MoviesAPIManagerProtocol) {
        self.apiManager = apiManager
    }
    
    ///load movies from local file
    func loadMoviesData() {
        self.apiManager?.readMoviesFromFile(completionBlock: { (movies, error) in
            self.presenter?.presentMoviesList(movies: movies)
        })
    }
}
