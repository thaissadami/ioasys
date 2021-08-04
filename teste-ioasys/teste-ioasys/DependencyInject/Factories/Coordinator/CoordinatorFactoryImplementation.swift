//
//  CoordinatorFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class CoordinatorFactoryImplementation: CoordinatorFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makeAuthenticateCoordinator() -> AuthenticationCoordinator {
        resolver.resolve(AuthenticationCoordinator.self)!
    }

    func makeSearchCoordinator() -> SearchCoordinator {
        return resolver.resolve(SearchCoordinator.self)!
    }
}
