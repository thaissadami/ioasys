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
    
    private func handle(response: Response, completion: ResultCompletion<LoginResponse>) {
        let encodedResponse = response.response(encoding: .isoLatin1)

        if var mappedResponse = try? encodedResponse.map(LoginResponse.self) {
            
            if let httpResponse = response.response {
                
                if let token = httpResponse.headers["access-token"] {
                    mappedResponse.token = token
                }
                
                if let uid = httpResponse.headers["uid"] {
                    mappedResponse.uid = uid
                }
                
                if let client = httpResponse.headers["client"] {
                    mappedResponse.client = client
                }
            }
            completion(.success(mappedResponse))
        }
    }
}

extension AuthRemoteDataSource: AppData.AuthRemoteDataSourceProtocol {

    public func login(_ form: LoginForm, completion: @escaping ResultCompletion<LoginResponse>) {
        
        dispatcher.call(endpoint: AuthTarget.logIn(email: form.email, password: form.password)) { result in
            switch result {
            case .success(let response):
                self.handle(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
