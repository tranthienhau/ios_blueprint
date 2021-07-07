//
//  UserDefaultService.swift
//  blueprint
//
//  Created by DatNguyen on 24/06/2021.
//

import Foundation

// swiftlint:disable identifier_name
class UserDefaultService: UserDefaultServiceProtocol {
    func save(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }

    func getBool(with key: String) -> Bool? {
        let bool = UserDefaults.standard.bool(forKey: key)
        return bool
    }

    func getString(with key: String) -> String? {
        let data = UserDefaults.standard.string(forKey: key)
        return data
    }

    func removeDataWith(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
// swiftlint:enable identifier_name
