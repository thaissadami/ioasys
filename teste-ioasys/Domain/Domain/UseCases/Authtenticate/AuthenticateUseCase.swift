//
//  AuthenticateUseCase.swift
//  Domain
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

public protocol AuthenticateUseCaseProtocol: AnyObject {

    func execute(_ form: LoginForm, completion: @escaping ResultCompletion<LoginResponse>)
}

public class AuthenticateUseCase {

    private let authRepository: AuthRepositoryProtocol

    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
}

extension AuthenticateUseCase: AuthenticateUseCaseProtocol {

    public func execute(_ form: LoginForm, completion: @escaping ResultCompletion<LoginResponse>) {
        
        //Domain cria um cara para expor (protocolo 'authRepository')
        authRepository.login(form, completion: completion)
    }
}
