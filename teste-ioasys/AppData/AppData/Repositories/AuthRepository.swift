//
//  AuthRepository.swift
//  AppData
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain

public class AuthRepository {

    private let localDataSource: AuthLocalDataSourceProtocol
    private let remoteDataSource: AuthRemoteDataSourceProtocol

    public init(localDataSource: AuthLocalDataSourceProtocol, remoteDataSource: AuthRemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
}

extension AuthRepository: Domain.AuthRepositoryProtocol {

    public func login(_ form: LoginForm, completion: @escaping ResultCompletion<LoginResponse>) {
        //AppData não conhece o Storage, criado protocol para acessar storage
        remoteDataSource.login(form) { result in
            switch result {
            case .success(let response):
                do {
                    let header = HeaderEnterprisesRequestDTO(token: response.token ?? "", uid: response.uid ?? "", client: response.client ?? "")
                    try self.localDataSource.saveHeader(header)
                    
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
