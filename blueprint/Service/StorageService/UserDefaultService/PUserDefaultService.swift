//
//  PUserDefaultService.swift
//  blueprint
//
//  Created by DatNguyen on 24/06/2021.
//

import Foundation

// swiftlint:disable identifier_name
protocol UserDefaultServiceProtocol {
    func save(data: Any, key: String)
    func getBool(with key: String) -> Bool?
    func getString(with key: String) -> String?
    func removeDataWith(key: String)
}
// swiftlint:enable identifier_name
