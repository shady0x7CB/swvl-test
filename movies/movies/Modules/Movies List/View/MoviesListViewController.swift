//
//  MoviesListViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    var presenter: MoviesListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension MoviesListViewController: MoviesListViewProtocol{
    
}
