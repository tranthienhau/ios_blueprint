//
//  UserDefaultServiceTest.swift
//  blueprintTests
//
//  Created by DatNguyen on 28/06/2021.
//

@testable import blueprint
import XCTest

class UserDefaultServiceTest: XCTestCase {

    var userDefaultService : UserDefaultService!
    
    override func setUpWithError() throws {
        userDefaultService = UserDefaultService()
    }

    override func tearDownWithError() throws {
        userDefaultService = nil
    }

   //MARK: Test Save and Get Data String
    func test_save_and_get_string() {
        //Give
        let stringTest = "Chelsea is Champion"
        userDefaultService.save(data: stringTest, key: "Chelsea")
        
        //When
        let stringReturn = userDefaultService.getString(with: "Chelsea")
        
        //Then
        XCTAssert(stringReturn != nil && stringReturn == stringTest)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
