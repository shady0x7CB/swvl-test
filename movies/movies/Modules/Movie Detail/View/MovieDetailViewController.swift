//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var presenter: MovieDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
extension MovieDetailViewController: MovieDetailViewProtocol{
    
}
