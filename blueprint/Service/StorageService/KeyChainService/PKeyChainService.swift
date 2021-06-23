//
//  PKeyChainService.swift
//  blueprint
//
//  Created by DatNguyen on 22/06/2021.
//

import Foundation
import KeychainSwift

protocol PKeyChainService {
    func save(data: Data, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws
    func save(string: String, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws
    func save(bool: Bool, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws
    func getDataWith(key: String) -> Data?
    func getStringWith(key: String) -> String?
    func getBoolWith(key: String) -> Bool?
    func delete(key: String)
    func clearAll()
}
