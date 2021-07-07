//
//  KeyChainService.swift
//  blueprint
//
//  Created by DatNguyen on 22/06/2021.
//

import Foundation
import KeychainSwift

// swiftlint:disable identifier_name
final class KeyChainService: KeyChainServicePrototcol {
    private let keyChain: KeychainSwift
    init(prefixKey: String, accessGroup: String?) {
        keyChain = KeychainSwift(keyPrefix: prefixKey)
        if let accessGroup = accessGroup {
            keyChain.accessGroup = accessGroup
        }
    }

    func save(data: Any,
              key: String,
              keyChainAccessOptions: KeychainSwiftAccessOptions?,
              completion: @escaping (Result<Void, Error>) -> Void) {
        if let data = data as? Data {
            save(data: data,
                 key: key,
                 keyChainAccessOptions: keyChainAccessOptions,
                 completion: completion
            )
        } else if let bool = data as? Bool {
            save(bool: bool,
                 key: key,
                 keyChainAccessOptions: keyChainAccessOptions,
                 completion: completion
            )
        } else {
            let string = String(describing: data)
            save(string: string,
                 key: key,
                 keyChainAccessOptions: keyChainAccessOptions,
                 completion: completion
            )
        }
    }

    func getDataWith(key: String) -> Data? {
        return keyChain.getData(key)
    }

    func getStringWith(key: String) -> String? {
        return keyChain.get(key)
    }

    func getBoolWith(key: String) -> Bool? {
        return keyChain.getBool(key)
    }

    func delete(key: String) {
        keyChain.delete(key)
    }

    func clearAll() {
        keyChain.clear()
    }

    private func save(data: Data,
                      key: String,
                      keyChainAccessOptions: KeychainSwiftAccessOptions?,
                      completion: @escaping (Result<Void, Error>) -> Void) {
        keyChain.set(data, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            let error = self.error(key: key)
            completion(.failure(error))
        } else {
            completion(.success(()))
        }
    }

    private func save(string: String,
                      key: String,
                      keyChainAccessOptions: KeychainSwiftAccessOptions?,
                      completion: @escaping (Result<Void, Error>) -> Void) {
        keyChain.set(string, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            let error = self.error(key: key)
            completion(.failure(error))
        } else {
            completion(.success(()))
        }
    }

    private func save(bool: Bool,
                      key: String,
                      keyChainAccessOptions: KeychainSwiftAccessOptions?,
                      completion: @escaping (Result<Void, Error>) -> Void) {
        keyChain.set(bool, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            let error = self.error(key: key)
            completion(.failure(error))
        } else {
            completion(.success(()))
        }
    }

    private func error(key: String) -> NSError {
        let error = NSError.init(domain: "ios_blueprint",
                                 code: 400,
                                 userInfo: [NSLocalizedDescriptionKey : key])
        return error
    }
}
// swiftlint:enable identifier_name
