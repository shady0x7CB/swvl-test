//
//  MoviesListPresenter.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol{
    weak var view: MoviesListViewProtocol?
    var interactor: MoviesListInteractorProtocol?
    var wireframe: MoviesListWireframeProtocol?
    
    var movies: [Movie] = []
    
    var filteredMovies: [Movie] = []
    
    var dictionary: [YearKey: [Movie]] = [:]{
        didSet{
            self.sections = self.dictionary.keys.sorted(by: {$0.value > $1.value})
        }
    }
    
    var sections: [YearKey] = []
    
    init(view: MoviesListViewProtocol, interactor: MoviesListInteractorProtocol, wireframe: MoviesListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    init() {}
    
    ///get movie from categorized list by year
    func getMovie(section: Int, index: Int) -> Movie?{
        //check if the secion and index number are valid
        if section >= 0 && section < self.sections.count{
            if let movies = dictionary[sections[section]]{
                return (index >= 0 && index < movies.count) ? movies[index] : nil
            }
        }
        return nil
    }
    
    ///get number of movies in each category
    func getMoviesCount(section: Int) -> Int{
        if section >= 0 && section < self.sections.count{
            return dictionary[sections[section]]?.count ?? 0
        }
        return 0
    }
    
    ///initialize view controller with all movies
    func viewWillAppear() {
        self.filteredMovies = self.movies
        self.dictionary = [:]
        dictionary[YearKey.all] = filteredMovies
        self.view?.reload()
    }
    
    
    
    /// get number of categories
    func getSectionsCount() -> Int {
        return self.sections.count
    }
    
    ///get associated year value from YearKey enum if exist
    private func getYear(yearKey: YearKey) -> Int?{
        switch yearKey {
        case .year(let year):
            return year
        default:
            return nil
        }
    }
    
    func getSections() -> [YearKey] {
        return self.sections
    }
    
    func getSection(index: Int) -> Int? {
        if index >= 0 && index < self.sections.count{
            return self.getYear(yearKey: sections[index])
        }
        return nil
    }
    
    ///returns all movies contains search text
    func search(searchTxt: String) {
        if searchTxt.count > 0{
            filteredMovies = movies.filter({ (movie) -> Bool in
                return movie.title.contains(searchTxt)
            })
            self.dictionary = categorizeListByYear(movies: self.filteredMovies)
        }else{
            filteredMovies = movies
            dictionary = [:]
            dictionary[YearKey.all] = filteredMovies
        }
        self.view?.reload()
    }
    
    ///returns a categorized lists by year
    func categorizeListByYear(movies: [Movie]) -> [YearKey: [Movie]]{
        var categorizedList: [YearKey: [Movie]] = [:]
        for movie in self.filteredMovies{
            if let _ = categorizedList[YearKey.year(movie.year)]{
                categorizedList[YearKey.year(movie.year)]?.append(movie)
            }else{
                categorizedList[YearKey.year(movie.year)] = [movie]
            }
        }
        for key in categorizedList.keys{
            categorizedList[key] = Array(countSort(arr: categorizedList[key]!).prefix(5))
        }
        return categorizedList
    }
    
    func countSort(arr: [Movie]) -> [Movie]
    {
        let max = arr.max()?.rating ?? 0
        let min = arr.min()?.rating ?? 0
        var count: [Int] = Array(repeating: 0, count: max - min + 1)
        var output: [Movie] = arr
        for i in 0..<arr.count{
            count[arr[i].rating - min] += 1;
        }

        for i in 1..<count.count{
            count[i] += count[i - 1];
        }

        for i in (0...(arr.count-1)).reversed(){
            output[count[arr[i].rating - min] - 1] = arr[i];
            count[arr[i].rating - min] -= 1;
        }
        return Array(output.reversed()[0..<arr.count])
    }
}
