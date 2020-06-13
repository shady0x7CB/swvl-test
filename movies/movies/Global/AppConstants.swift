//
//  AppConstants.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

public class AppConstants{
    public static let flickrKey: String = "d91d18ca94379a030789c30eb6003cdb"
    public static let flickrSecret: String = "04f9d165d3ff402e"
    
    public static let flickrUrl: String = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key={key}&format=json&nojsoncallback=1&text={title}&per_page=10"
    
    public static let moviesPath: String = "movies"
    
    public enum LocalFileKeys: String{
        case movies
    }
}
