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

        // Do any additional setup after loading the view.
    }

}
extension SplashViewController: SplashViewProtocol{
    
}
