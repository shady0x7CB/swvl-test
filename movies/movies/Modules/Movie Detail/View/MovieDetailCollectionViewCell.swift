//
//  MovieDetailCollectionViewCell.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/14/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupView(image: String){
        //set image view using sdwebimage
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        imageView.sd_imageIndicator?.startAnimatingIndicator()
        imageView.sd_setImage(with: URL(string: image), placeholderImage: nil, options: .highPriority, context: nil, progress: nil) { (image, error, cacheType, downloadUrl) in
            self.imageView.sd_imageIndicator?.stopAnimatingIndicator()
        }
    }
}
