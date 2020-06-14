//
//  FlickrPictureContainer.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/14/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

struct FlickrPictureContainer: Codable {

    enum CodingKeys: String, CodingKey {
        case photos
        case stat
    }

    var photos: FlickrWrapper
    var stat: String
    
}
