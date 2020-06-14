//
//  FlickrWrapper.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/14/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

struct FlickrWrapper: Codable {

    enum CodingKeys: String, CodingKey {
        case page
        case pages
        case perpage
        case total
        case photo
    }

    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [FlickrPicture]
    
}
