//
//  AuthRemoteDataSource.swift
//  Networking
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain
import AppData
import OxeNetworking
import Moya

public class AuthRemoteDataSource {

    private let dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
}

extension AuthRemoteDataSource: AppData.AuthRemoteDataSourceProtocol {

    public func login(_ form: LoginForm, completion: @escaping (Result<LoginResponse, Error>) -> ()) {
        dispatcher.getDecodable(LoginResponse.self, from: AuthTarget.logIn(email: form.email, password: form.password)) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
