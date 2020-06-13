//
//  MoviesListPresenter.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol{
    weak var view: MoviesListViewProtocol?
    var interactor: MoviesListInteractorProtocol?
    var wireframe: MoviesListWireframeProtocol?
    
    
    init(view: MoviesListViewProtocol, interactor: MoviesListInteractorProtocol, wireframe: MoviesListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }}
