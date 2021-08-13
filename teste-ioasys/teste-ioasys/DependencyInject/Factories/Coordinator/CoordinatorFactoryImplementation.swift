//
//  CoordinatorFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
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
