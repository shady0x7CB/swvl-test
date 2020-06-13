//
//  FlickrApiManager.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/14/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation
import Alamofire

protocol FlickrApiDataManager {
    func getPhotoes(movieTitle: String, completionBlock: @escaping (_ models: FlickrPictureContainer?, _ error: String?) -> Void)
}

class FlickrApiManager: FlickrApiDataManager{
    
    ///get photos from flickr api with movie title
    func getPhotoes(movieTitle: String, completionBlock: @escaping (FlickrPictureContainer?, String?) -> Void) {
        var url = AppConstants.flickrUrl.replacingOccurrences(of: "{key}", with: AppConstants.flickrKey)
        
        //adding double quotes to text parameter and replace white spaces with url encodings
        guard let title = ("\"" + "\(movieTitle)" + "\"").addingPercentEncoding(withAllowedCharacters: .alphanumerics) else{
            completionBlock(nil, "Invalid Url")
            return
        }
        url = url.replacingOccurrences(of: "{title}", with: title)
        AF.request(url)
        .validate()
        .responseDecodable(of: FlickrPictureContainer.self) { (response) in
            guard let container = response.value else {
                return completionBlock(nil, "No Images available")
            }
            return completionBlock(container, nil)
        }
    }
    
}
