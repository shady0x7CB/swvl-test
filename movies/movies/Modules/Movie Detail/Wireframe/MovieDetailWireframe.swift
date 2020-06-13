//
//  MovieDetailWireframe.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MovieDetailWireframe{
    
    ///create movie detail controller
    class func setupModule() -> UINavigationController {
        if let moduleViewController = R.storyboard.movie.movieDetailViewController(){
            let interactor = MovieDetailInteractor()
            let presenter = MovieDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: MovieDetailWireframe())
            moduleViewController.presenter = presenter
            interactor.presenter = presenter
            
            let navigationController = UINavigationController(rootViewController: moduleViewController)
            navigationController.isNavigationBarHidden = true
            navigationController.restorationIdentifier = "movieDetail"
            
            return  navigationController
       }
       return UINavigationController()
    }
    
}
extension MovieDetailWireframe: MovieDetailWireframeProtocol{

}
