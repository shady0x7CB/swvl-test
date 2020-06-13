//
//  FlickrPicture.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/14/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

struct FlickrPicture: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case secret
        case server
        case farm
        case title
        case ispublic
        case isfriend
        case isfamily
        
    }
    
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
    
    var url: String{
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
}
