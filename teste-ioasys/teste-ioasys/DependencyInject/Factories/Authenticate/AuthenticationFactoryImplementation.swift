//
//  AuthenticationFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject

class AuthenticationFactoryImplementation: AuthenticationFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makeLoginViewController() -> LoginViewController {
        guard let presenter = resolver.resolve(LoginViewPresenting.self) as? LoginPresenter else {
            preconditionFailure("LoginViewPresenting is nil")
        }
        let loginViewController = LoginViewController(presenter: presenter)
        presenter.attach(loginViewController)
        return loginViewController
    }

}
