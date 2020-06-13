//
//  SplashPresenter.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol{
    
    weak var view: SplashViewProtocol?
    var interactor: SplashInteractorProtocol?
    var wireframe: SplashWireframeProtocol?
    
    
    init(view: SplashViewProtocol, interactor: SplashInteractorProtocol, wireframe: SplashWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
}
