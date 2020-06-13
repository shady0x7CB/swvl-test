//
//  SplitWireframe.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class SplitWireframe{
    
    class func buildSplitVc() -> SplitViewController {
        
        let masterViewController = MoviesListWireframe.setupModule()
        let detailViewController = MovieDetailWireframe.setupModule()
        
        let navigationControllers: [UINavigationController] = [masterViewController, detailViewController]
        
        if let splitViewController = R.storyboard.main.splitViewController(){
            splitViewController.viewControllers = navigationControllers
            splitViewController.preferredDisplayMode = .allVisible
            return splitViewController
        }
        return SplitViewController()
    }
}
