//
//  MovieDetailProtocols.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

protocol MovieDetailPresenterProtocol: class {
    func back()
    func getMovie() -> Movie?
    func viewWillAppear()
    func loadPhotosUrls(urls: [String])
    func showError(error: String)
}

protocol MovieDetailInteractorProtocol: class {
    func getPhotoes(title: String)
}

protocol MovieDetailViewProtocol: class {
    func loadPhotosUrls(urls: [String])
    func showError(error: String)
}

protocol MovieDetailWireframeProtocol: class {
    func back(from view: UIViewController)
}
