//
//  AuthLocalDataSource.swift
//  Storage
//
//  Created by Thais Sadami on 06/08/21.
//

import AppData

public class AuthLocalDataSource {
    public let userDefaults: UserDefaultsStorage
    public let keychain: KeychainStorage

    public init(userDefaults: UserDefaultsStorage, keychain: KeychainStorage) {
        self.userDefaults = userDefaults
        self.keychain = keychain
    }
}

extension AuthLocalDataSource: AppData.AuthLocalDataSourceProtocol {
//    public func save(investor: Investor) throws {
//        let data = try JSONEncoder().encode(investor)
//        try keychain.set(data, keyable: .investor)
//    }
    
    public func saveToken(_ token: String) throws {
        try keychain.set(token, keyable: .token)
    }

    public func saveUid(_ uid: String) throws {
        try keychain.set(uid, keyable: .uid)
    }

    public func saveClient(_ client: String) throws {
        try keychain.set(client, keyable: .client)
    }
    
    
}
