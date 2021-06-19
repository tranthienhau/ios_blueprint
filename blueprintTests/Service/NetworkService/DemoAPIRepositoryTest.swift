//
//  DemoAPIManagerTest.swift
//  blueprintTests
//
//  Created by DatNguyen on 15/06/2021.
//

import XCTest
@testable import blueprint

class DemoAPIManagerTest: XCTestCase {

    var demoAPIManager : DemoAPIRepository!
    
    override func setUpWithError() throws {
        demoAPIManager = DemoAPIRepository()
    }

    override func tearDownWithError() throws {
        demoAPIManager = nil
    }

   //MARK: - Test Get List Video
    func test_callfetchPopularMovies_returnResultWithDataOrError() {
        // Given
        var dataReturn : MoviResponse?
        var errorReturn : Error?
        
        // When
        let expectation = XCTestExpectation(description: "results")
        demoAPIManager.fetchPopularMovies { result in
            switch result {
            case .success(let moviesResponse) :
                dataReturn = moviesResponse
            case .failure(let error) :
                errorReturn = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
        
        // Then
        XCTAssert(dataReturn != nil || errorReturn != nil)
    }
    
    func test_callfetchPopularMovies_returnDataMovies() {
        // Given
        var dataReturn : MoviResponse?
        
        // When
        let expectation = XCTestExpectation(description: "results")
        demoAPIManager.fetchPopularMovies { result in
            switch result {
            case .success(let moviesResponse) :
                dataReturn = moviesResponse
            case .failure( _) :
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
        
        // Then
        XCTAssert(dataReturn != nil && dataReturn?.results != nil)
    }
    
    func test_callfetchPopularMovies_returnError() {
        // Given
        AppConstants.hostUrl = "https://api.themoviedb.org"
        var errorReturn : Error?
        
        // When
        let expectation = XCTestExpectation(description: "results")
        demoAPIManager.fetchPopularMovies { result in
            switch result {
            case .success( _) :
                break
            case .failure(let error) :
                errorReturn = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
        
        // Then
        XCTAssert(errorReturn != nil && errorReturn?.localizedDescription != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

