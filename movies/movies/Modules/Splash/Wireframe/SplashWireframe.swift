//
//  SplashWireframe.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class SplashWireframe: SplashWireframeProtocol{
    
    ///create splash module
    class func setupModule() -> UIViewController {
        if let splashVc = R.storyboard.main.splashViewController(){
            let interactor = SplashInteractor()
            let presenter = SplashPresenter(view: splashVc, interactor: interactor, wireframe: SplashWireframe())
            splashVc.presenter = presenter
            interactor.presenter = presenter
            return splashVc
        }
        return UIViewController()
    }
    
}
