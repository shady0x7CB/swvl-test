//
//  SplashViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var presenter: SplashPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        //delay splash screen for 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //load movies from local file
            self.presenter?.loadMoviesData()
        }
    }

}
extension SplashViewController: SplashViewProtocol{
    
}
