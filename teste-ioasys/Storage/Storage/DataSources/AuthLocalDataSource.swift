//
//  AuthLocalDataSource.swift
//  Storage
//
//  Created by Thais Sadami on 06/08/21.
//

import Domain
import AppData

public class AuthLocalDataSource {
    public init() {}
}

extension AuthLocalDataSource: AppData.AuthLocalDataSourceProtocol {
    
    //abstração keychain para salvar os dados 

    public func save(_ investor: Investor, completion: @escaping (Result<Void, Error>) -> ()) {
        completion(.success(()))
    }
}
