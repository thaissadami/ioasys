//
//  LoginPresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation
import Domain

protocol LoginViewable: ViewLoadable {

    func showAlert(message: String)
    func showEmailError(_ message: String)
    func showPasswordError(_ message: String)
}

protocol LoginSceneCoordinating {
    func showSearch()
}

class LoginPresenter {

    private weak var view: LoginViewable?
    private let coordinator: LoginSceneCoordinating
    private let formValidateUseCase: LoginFormValidateUseCaseProtocol

    init(coordinator: LoginSceneCoordinating, formValidateUseCase: LoginFormValidateUseCaseProtocol) {
        self.coordinator = coordinator
        self.formValidateUseCase = formValidateUseCase
    }

    func attach(_ view: LoginViewable) {
        self.view = view
    }

}

extension LoginPresenter: LoginViewPresenting {

    func logIn(email: String, password: String) {

        let loginForm = LoginForm(email: email, password: password)
        formValidateUseCase.execute(loginForm) { result in

            switch result {
            case .success:
                coordinator.showSearch()
            case .failure(let error):
                switch error {
                case .email(let emailError):
                    handleBusinessEmailError(emailError)
                case .password(let passwordError):
                    handleBusinessPasswordError(passwordError)
                }
            }
        }
    }
    
    private func handleBusinessEmailError(_ error: LoginFormValidateUseCaseError.Email) {
        switch error {
        case .empty:
            view?.showEmailError("Campo de e-mail vazio")
        case .invalid:
            view?.showEmailError("E-mail inválido")
        }
    }

    private func handleBusinessPasswordError(_ error: LoginFormValidateUseCaseError.Password) {
        switch error {
        case .empty:
            view?.showPasswordError("Campo de senha vazio")
        case .weak:
            view?.showPasswordError("Senha fraca :(")
        }
    }
}
