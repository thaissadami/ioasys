//
//  AuthenticationFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
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
