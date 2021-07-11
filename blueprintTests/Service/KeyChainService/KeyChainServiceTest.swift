//
//  KeyChainServiceTest.swift
//  blueprintTests
//
//  Created by DatNguyen on 28/06/2021.
//

@testable import blueprint
import XCTest

class KeyChainServiceTest: XCTestCase {

    var keyChainService : KeyChainService!
    
    override func setUpWithError() throws {
        keyChainService = KeyChainService(prefixKey: "KeyChainTest", accessGroup: nil)
    }

    override func tearDownWithError() throws {
       keyChainService = nil
    }

    //MARK: Test Function Save Data
    
    func test_save_dataString() {
        
        var onSuccess = false
        
        //Give
        let stringTest = "String Test"
        let dataTest = Data(stringTest.utf8)
        
        //When
        keyChainService.save(data: dataTest, key: "SaveData", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success:
                onSuccess = true
            case .failure(_):
                onSuccess = false
            }
        }
        
        //Then
        XCTAssert(onSuccess == true)

    }
    
    func test_save_valueBool() {
        var onSuccess : Bool?
        
        //Given
        let valueBool = true
        
        //When
        keyChainService.save(data: valueBool, key: "SaveBool", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success :
                onSuccess = true
            case .failure(_):
                onSuccess = false
            }
        }
        
        //Then
        XCTAssert(onSuccess != nil && onSuccess == true)

    }
    
    func test_save_valueInt() {
        var onSuccess : Bool?
        
        //Given
        let valueInt = 24
        
        //When
        keyChainService.save(data: valueInt, key: "SaveInt", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success:
                onSuccess = true
            case .failure(_):
                onSuccess = false
            }
        }

        //Then
        XCTAssert(onSuccess != nil && onSuccess == true)
    }
    
    //MARK : Test Get Data
    func test_get_dataString() {
        
        //Given
        let stringTest = "String Test"
        let dataTest = Data(stringTest.utf8)
        keyChainService.save(data: dataTest, key: "SaveData", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success(_) :
                print("Success")
            case let .failure(error):
                print("Error \(error)")
            }
        }

        //When
        let dataReturn = keyChainService.getDataWith(key: "SaveData")
        
        //Then
        
        var expectString : String?
        
        guard let data = dataReturn else {return}
        expectString = String(decoding: data, as: UTF8.self)
        
        XCTAssert(expectString != nil && expectString == stringTest)
    }
    
    func test_get_valueBool() {
        //Given
        let valueBool = true
        keyChainService.save(data: valueBool, key: "SaveBool", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success(_) :
                print("Success")
            case let .failure(error):
                print("Error \(error)")
            }
        }
        
        //When
        let boolReturn = keyChainService.getBoolWith(key: "SaveBool")
        
        //Then
        XCTAssert(boolReturn != nil && boolReturn == valueBool)

    }
    
    func test_get_valueDouble() {
        //Given
        let valueDouble = 24.48
        keyChainService.save(data: valueDouble, key: "SaveDouble", keyChainAccessOptions: .none) { (result) in
            switch result {
            case .success(_) :
                print("Success")
            case let .failure(error):
                print("Error \(error)")
            }
        }
        
        //When
        let stringDouble = keyChainService.getStringWith(key: "SaveDouble")
        
        //Then
        var expectDouble : Double?
        guard let doubleStr = stringDouble else {return}
        expectDouble = Double(doubleStr)
        
        XCTAssert(expectDouble != nil && expectDouble == valueDouble)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
