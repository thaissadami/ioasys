//
//  DomainAssembly.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 06/08/21.
//

import Swinject
import Domain

class DomainAssembly: Assembly {

    func assemble(container: Container) {
        assembleAuthentication(container)
        assembleSearch(container)
    }
    
    private func assembleAuthentication(_ container: Container) {
        container.register(Domain.LoginFormValidateUseCaseProtocol.self) { _ in
            LoginFormValidateUseCase()
        }
        container.autoregister(Domain.AuthenticateUseCaseProtocol.self, initializer: Domain.AuthenticateUseCase.init)
    }
    
    private func assembleSearch(_ container: Container) {
//        container.register(Domain.EnterprisesUseCaseProtocol.self) { _ in
//            EnterprisesUseCase()
//        }
        container.autoregister(Domain.EnterprisesUseCaseProtocol.self, initializer: Domain.EnterprisesUseCase.init)
    }

}

