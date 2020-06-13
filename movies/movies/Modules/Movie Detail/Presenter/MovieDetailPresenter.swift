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
    var movie: Movie?
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorProtocol, wireframe: MovieDetailWireframeProtocol, movie: Movie?) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.movie = movie
    }
    
    ///back to master view
    func back() {
        self.wireframe?.back(from: self.view as! MovieDetailViewController)
    }
    
    ///returns movie
    func getMovie() -> Movie? {
        return self.movie
    }
    
    
    ///initialize view with movie
    func viewWillAppear() {
        if let mov = self.movie{
            //fetch photos with movie title
            self.interactor?.getPhotoes(title: mov.title)
        }
    }
    
    ///load photoes urls to view
    func loadPhotosUrls(urls: [String]) {
        self.view?.loadPhotosUrls(urls: urls)
    }
    
    ///show loading error
    func showError(error: String) {
        self.view?.showError(error: error)
    }
}
