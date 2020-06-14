//
//  MovieDetailInteractor.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol{
    weak var presenter: MovieDetailPresenterProtocol?
    var flickrApiDataManager: FlickrApiDataManager?
    
    init(flickrDataManager: FlickrApiDataManager) {
        self.flickrApiDataManager = flickrDataManager
    }
    
    ///fetch photos with movie title
    func getPhotoes(title: String) {
        self.flickrApiDataManager?.getPhotoes(movieTitle: title, completionBlock: { (container, error) in
            guard let photosContainer = container else{
                self.presenter?.showError(error: error ?? "No images available")
                return
            }
            if photosContainer.photos.photo.count > 0{
                self.presenter?.loadPhotosUrls(urls: photosContainer.photos.photo.map({$0.url}))
            }else{
                self.presenter?.showError(error: error ?? "No images available")
            }
            
        })
    }
}
