//
//  MoviesListWireframe.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MoviesListWireframe{
    
    //MARK: - Initiation
    class func setupModule(movies: [Movie]) -> UINavigationController {
        if let moduleViewController = R.storyboard.movie.moviesListViewController(){
            let interactor = MoviesListInteractor()
            let presenter = MoviesListPresenter(view: moduleViewController, interactor: interactor, wireframe: MoviesListWireframe())
            moduleViewController.presenter = presenter
            interactor.presenter = presenter
            presenter.movies = movies
            let navigationController = UINavigationController(rootViewController: moduleViewController)
            navigationController.isNavigationBarHidden = true
            navigationController.restorationIdentifier = "movieList"
            
            return navigationController
        }
        return UINavigationController()
    }
        
}
extension MoviesListWireframe: MoviesListWireframeProtocol{}
