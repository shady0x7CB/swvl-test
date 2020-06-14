//
//  SplashProtocol.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

protocol SplashPresenterProtocol: class {
    func loadMoviesData()
    func presentMoviesList(movies: [Movie])
}

protocol SplashInteractorProtocol: class {
    func loadMoviesData()
}

protocol SplashViewProtocol: class {
    
}

protocol SplashWireframeProtocol: class {
    func presentMoviesList(movies: [Movie])
}
