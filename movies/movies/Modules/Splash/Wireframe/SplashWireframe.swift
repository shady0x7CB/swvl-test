//
//  SplashWireframe.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class SplashWireframe: SplashWireframeProtocol{
    
    ///create splash module
    class func setupModule() -> UIViewController {
        if let splashVc = R.storyboard.main.splashViewController(){
            let interactor = SplashInteractor(apiManager: MoviesAPIManager())
            let presenter = SplashPresenter(view: splashVc, interactor: interactor, wireframe: SplashWireframe())
            splashVc.presenter = presenter
            interactor.presenter = presenter
            return splashVc
        }
        return UIViewController()
    }
    
    ///navigate to master view with list of movies
    func presentMoviesList(movies: [Movie]) {
        let splitVc = SplitWireframe.buildSplitVc(movies: movies)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = splitVc
            window.makeKeyAndVisible()
        }
    }
    
}
