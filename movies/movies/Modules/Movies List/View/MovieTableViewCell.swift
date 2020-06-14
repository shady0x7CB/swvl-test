//
//  MovieTableViewCell.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit
import Cosmos

class MovieTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieCategory: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    func setupView(movie: Movie?){
        //setup table view cell with movie content
        containerView.layer.cornerRadius = 15
        self.ratingView.isUserInteractionEnabled = false
        if let mov = movie{
            self.movieTitle.text = mov.title
            self.movieCategory.isHidden = mov.genres.count == 0
            self.movieCategory.text = "Categories: " + mov.genres.joined(separator: ", ")
            self.ratingView.rating = Double(mov.rating)
        }
        
    }
}
