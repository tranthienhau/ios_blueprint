//
//  PKeyChainService.swift
//  blueprint
//
//  Created by DatNguyen on 22/06/2021.
//

import Foundation
import KeychainSwift

// swiftlint:disable identifier_name
protocol KeyChainServicePrototcol {
    func save(data: Any,
              key: String,
              keyChainAccessOptions: KeychainSwiftAccessOptions?,
              completion: @escaping (Result<Void, Error>) -> Void)
    func getDataWith(key: String) -> Data?
    func getStringWith(key: String) -> String?
    func getBoolWith(key: String) -> Bool?
    func delete(key: String)
    func clearAll()
}
// swiftlint:enable identifier_name 
