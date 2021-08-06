//
//  DomainAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 06/08/21.
//

import Swinject
import Domain

class DomainAssembly: Assembly {

    func assemble(container: Container) {

        container.register(Domain.LoginFormValidateUseCaseProtocol.self) { _ in
            LoginFormValidateUseCase()
        }
    }

}

