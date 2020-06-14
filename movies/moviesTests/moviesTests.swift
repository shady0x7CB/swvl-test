//
//  moviesTests.swift
//  moviesTests
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import XCTest
@testable import movies

class moviesTests: XCTestCase {

    var moviesApi: MoviesAPIManagerProtocol!
    var flickrApi: FlickrApiDataManager!
    var moviesListPresenter: MoviesListPresenter!
    
    override func setUp() {
        super.setUp()
        moviesApi = MoviesAPIManager()
        flickrApi = FlickrApiManager()
        moviesApi.readMoviesFromFile { (movies, error) in
            self.moviesListPresenter = MoviesListPresenter(movies: movies)
        }
    }

    override func tearDown() {
        moviesApi = nil
        flickrApi = nil
        moviesListPresenter = nil
        super.tearDown()
    }

    func testLoadingFlickrPhotosForEachMovie() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        moviesApi.readMoviesFromFile { (movies, error) in
            if let err = error{
                XCTFail(err.localizedDescription)
            }else{
                XCTAssertNotNil(movies)
            }
            for movie in movies{
                self.flickrApi.getPhotoes(movieTitle: movie.title) { (flickerContainer, error) in
                    if let err = error{
                        XCTFail(err)
                    }else{
                        XCTAssertNotNil(flickerContainer)
                    }
                }
            }
        }
    }
    
    func testSorting() {
        //testing decreasing order sorting
        let movie6 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 6])
        let movie4 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 4])
        let movie1 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 1])
        let movie3 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 3])
        let movie5 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 5])
        let movie2 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 2])
        let movie0 = Movie(dictionary: ["title" : "title", "year" : 2020, "cast": [], "genres": [], "rating": 0])

        let movies: [Movie] = [movie6, movie0, movie1, movie2, movie3, movie5, movie4]
        let sorted = moviesListPresenter.countSort(arr: movies)
        let expected = [movie6, movie5, movie4, movie3, movie2, movie1, movie0]
        XCTAssertEqual(sorted, expected)
    }
    
    func testCategorizing(){
        //testing categorizing movies by year
        let movie6 = Movie(dictionary: ["title" : "title1", "year" : 2010, "cast": [], "genres": [], "rating": 6])
        let movie4 = Movie(dictionary: ["title" : "title2", "year" : 2010, "cast": [], "genres": [], "rating": 4])
        let movie1 = Movie(dictionary: ["title" : "title3", "year" : 2020, "cast": [], "genres": [], "rating": 1])
        let movie3 = Movie(dictionary: ["title" : "title4", "year" : 2020, "cast": [], "genres": [], "rating": 3])
        let movie5 = Movie(dictionary: ["title" : "title5", "year" : 2013, "cast": [], "genres": [], "rating": 5])
        let movie2 = Movie(dictionary: ["title" : "title6", "year" : 2013, "cast": [], "genres": [], "rating": 2])
        let movie0 = Movie(dictionary: ["title" : "title7", "year" : 2012, "cast": [], "genres": [], "rating": 0])
        let movies = [movie0, movie1, movie2, movie3, movie4, movie5, movie6]
        let categorizedList: [YearKey: [Movie]] = moviesListPresenter.categorizeListByYear(movies: movies)
        let expectedList: [YearKey: [Movie]] = [
            YearKey.year(2020) : [movie3, movie1],
            YearKey.year(2012) : [movie0],
            YearKey.year(2010) : [movie6, movie4],
            YearKey.year(2013) : [movie5, movie2]
            
        ]
        XCTAssertEqual(categorizedList, expectedList)
    }


    func testSearchingPerformance() {
        // This is an example of a performance test case.
        self.measure {
            self.moviesListPresenter.search(searchTxt: "the")
        }
    }
    
    func testLoadingLocalDataPerformance() {
        // This is an example of a performance test case.
        self.measure {
            moviesApi.readMoviesFromFile { (movies, error) in
                if let err = error{
                    XCTFail(err.localizedDescription)
                }else{
                    XCTAssertNotNil(movies)
                }
            }
        }
    }
    
    func testLoadingUrlsFromFlickr() {
        // This is an example of a performance test case.
        let random = Int.random(in: 0..<moviesListPresenter.movies.count)
        self.measure {
            flickrApi.getPhotoes(movieTitle: self.moviesListPresenter.movies[random].title) { (container, error) in
                if let err = error{
                    XCTFail(err)
                }else{
                    XCTAssertNotNil(container)
                }
            }
        }
    }

}
