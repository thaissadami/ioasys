//
//  AuthenticationFlowAssembly.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import Swinject

class AuthenticationFlowAssembly: Assembly {

    func assemble(container: Container) {
        let authCoordinator = container.resolveSafe(AuthenticationCoordinator.self)

        //MARK: LoginScene
        container.register(LoginSceneCoordinating.self) { _ in authCoordinator}
        
        //já está dentro do container a linha debaixo faz de forma automática (instanciar presenter e coordinator e inserir dentro do container)
        container.autoregister(LoginViewPresenting.self, initializer: LoginPresenter.init)
    }
}
