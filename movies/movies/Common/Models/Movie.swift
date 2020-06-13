//
//  Movie.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

struct Movie: Comparable {
    enum MovieKeys: String {
        case title
        case year
        case cast
        case genres
        case rating
    }
    
    var title: String
    var year: Int
    var cast: [String]
    var genres: [String]
    var rating: Int
    
    var dictionary: [String: Any] {
      return [
        MovieKeys.title.rawValue: title,
        MovieKeys.year.rawValue: year,
        MovieKeys.cast.rawValue: cast,
        MovieKeys.genres.rawValue: genres,
        MovieKeys.rating.rawValue: rating,
        ]
    }
    
    
    init(dictionary: [String : Any]) {
        self.title = dictionary[MovieKeys.title.rawValue] as? String ?? ""
        self.year = dictionary[MovieKeys.year.rawValue] as? Int ?? 2020
        self.cast = dictionary[MovieKeys.cast.rawValue] as? [String] ?? []
        self.genres = dictionary[MovieKeys.genres.rawValue] as? [String] ?? []
        self.rating = dictionary[MovieKeys.rating.rawValue] as? Int ?? 0
    }
    
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.rating < rhs.rating
    }

}
