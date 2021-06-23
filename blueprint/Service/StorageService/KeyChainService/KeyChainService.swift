//
//  KeyChainService.swift
//  blueprint
//
//  Created by DatNguyen on 22/06/2021.
//

import Foundation
import KeychainSwift

enum KeyChainError: Error {
    case saveFailed(key: String)
}

class KeyChainService: PKeyChainService {
    
    let keyChain : KeychainSwift!
    init(prefixKey: String, accessGroup: String?) {
        keyChain = KeychainSwift(keyPrefix: prefixKey)
        if accessGroup != nil {
            keyChain.accessGroup = accessGroup
        }
    }
    
    func save(data: Data, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws {
        keyChain.set(data, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            throw KeyChainError.saveFailed(key: key)
        }
    }
    
    func save(string: String, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws {
        keyChain.set(string, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            throw KeyChainError.saveFailed(key: key)
        }
    }
    
    func save(bool: Bool, key: String, keyChainAccessOptions: KeychainSwiftAccessOptions?) throws {
        keyChain.set(bool, forKey: key, withAccess: keyChainAccessOptions ?? .accessibleWhenUnlocked)
        if keyChain.lastResultCode != noErr {
            throw KeyChainError.saveFailed(key: key)
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
    
}
