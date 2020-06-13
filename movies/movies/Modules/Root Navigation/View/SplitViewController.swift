//
//  SplitViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit


class SplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension SplitViewController: UISplitViewControllerDelegate{
    func splitViewController(
             _ splitViewController: UISplitViewController,
             collapseSecondary secondaryViewController: UIViewController,
             onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
