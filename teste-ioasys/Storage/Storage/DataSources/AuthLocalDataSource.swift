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
    public func saveHeader(_ header: HeaderEnterprisesRequestDTO) throws {
        let data = try JSONEncoder().encode(header)
        try keychain.set(data, keyable: .header)
    }
    
    public func getHeader() throws -> HeaderEnterprisesRequestDTO {
        
        
        let header = try? keychain.getData(keyable: .header)
        guard let data = try? JSONDecoder().decode(HeaderEnterprisesRequestDTO.self, from: header ?? Data())
        else{
            return HeaderEnterprisesRequestDTO(token: "", uid: "", client: "")
        }
        
        return data
    }
    
}
