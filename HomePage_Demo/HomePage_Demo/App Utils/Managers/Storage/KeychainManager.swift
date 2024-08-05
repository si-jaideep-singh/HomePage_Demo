//
//  KeychainManager.swift
//  Lucknow Super Giants
//
//  Created by Valentine Miranda on 20/02/23.
//

import Foundation
import KeychainSwift

struct KeychainIdentifierKeys {
    static let keychainServiceNameKey = CommonParameter.appName
    static let keychainSavedAppleUserKey = "saved_apple_user_details"
    static let keychainDeviceToken = "saved_device_token"
}

final class KeychainManager {
    
//    static let shared = KeychainManager()
    private let keychain = KeychainSwift(keyPrefix: KeychainIdentifierKeys.keychainServiceNameKey)
    
//    func set(value: Data, forKey: String) {
//        keychain.set(value, forKey: forKey)
//    }
//    
//    func getData(key: String, reference: Bool = false) -> Data? {
//        return keychain.getData(key, asReference: reference)
//    }
}
