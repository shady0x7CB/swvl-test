//
//  MoviesListProtocols.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

enum YearKey: Hashable {
    case year(Int)
    case all
    
    var value: Int{
        switch self {
        case .year(let year):
            return year
        default:
            return 0
        }
    }
}

protocol MoviesListPresenterProtocol: class {
    func getMovie(section: Int, index: Int) -> Movie?
    func getMoviesCount(section: Int) -> Int
    func viewWillAppear()
    func search(searchTxt: String)
    func getSectionsCount() -> Int
    func getSections() -> [YearKey]
    func getSection(index: Int) -> Int?
    func categorizeListByYear(movies: [Movie]) -> [YearKey: [Movie]]
    func countSort(arr: [Movie]) -> [Movie]
}

protocol MoviesListInteractorProtocol: class {
    
}

protocol MoviesListViewProtocol: class {
    func reload()
}

protocol MoviesListWireframeProtocol: class {
    
}
