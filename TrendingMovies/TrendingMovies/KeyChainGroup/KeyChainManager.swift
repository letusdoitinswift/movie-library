//
//  KeyChainManager.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/16/24.
//

import Foundation
import Security

final class KeyChainManager {
    
    private init() {}
    
    static var instance = KeyChainManager()
    
    // Store the incoming key
    func store(value: String, forKey: String) -> Bool {
        let keyChainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: KeyChainConstants.bundleIdentifier,
            kSecAttrAccount as String: forKey,
            kSecValueData as String: value.data(using: .utf8) ?? Data()
        ]
        
        // Checking if it exists already
        SecItemDelete(keyChainQuery as CFDictionary)
        
        // Adding the new key
        let status = SecItemAdd(keyChainQuery as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    // Retrieve the key
    func retrieve(forKey: String) -> String? {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: KeyChainConstants.bundleIdentifier,
            kSecAttrAccount as String: forKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }
    
    func deleteAPIKey(forKey: String) -> Bool {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: KeyChainConstants.bundleIdentifier,
            kSecAttrAccount as String: forKey
        ]

        let status = SecItemDelete(keychainQuery as CFDictionary)
        return status == errSecSuccess
    }
}
