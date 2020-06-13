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

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            self.moviesListPresenter.search(searchTxt: "")
        }
    }

}
