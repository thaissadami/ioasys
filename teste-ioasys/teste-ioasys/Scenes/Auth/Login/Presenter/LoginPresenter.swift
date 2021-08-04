//
//  LoginPresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation

protocol LoginViewable: ViewLoadable {

    func showAlert(message: String)
}

protocol LoginSceneCoordinating {
    func showSearch()
}

class LoginPresenter {

    private weak var view: LoginViewable?
    private let coodinator: LoginSceneCoordinating

    init(coordinator: LoginSceneCoordinating) {
        self.coodinator = coordinator
    }

    func attach(_ view: LoginViewable) {
        self.view = view
    }

}

extension LoginPresenter: LoginViewPresenting {

    func logIn(email: String, password: String) {
        #warning("TODO - Integrar com Domain")
        coodinator.showSearch()
    }
}
