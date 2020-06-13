//
//  MovieDetailPresenter.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol{
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var wireframe: MovieDetailWireframeProtocol?
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorProtocol, wireframe: MovieDetailWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
