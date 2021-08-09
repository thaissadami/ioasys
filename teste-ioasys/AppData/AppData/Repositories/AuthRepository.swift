//
//  AuthRepository.swift
//  AppData
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain

public class AuthRepository {

    private let localDatSource: AuthLocalDataSourceProtocol
    private let remoteDatSource: AuthRemoteDataSourceProtocol

    public init(localDatSource: AuthLocalDataSourceProtocol, remoteDatSource: AuthRemoteDataSourceProtocol) {
        self.localDatSource = localDatSource
        self.remoteDatSource = remoteDatSource
    }
}

extension AuthRepository: Domain.AuthRepositoryProtocol {

    public func login(_ form: LoginForm, completion: @escaping (Result<LoginResponse, Error>) -> ()) {
        //TODO SALVAR NO STORAGE PARA O DOMAIN PEGAR
        //AppData não conhece o Storage, criado protocol para acessar storage
        remoteDatSource.login(form) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                self.localDatSource.save(response.investor, completion: { _ in })
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
