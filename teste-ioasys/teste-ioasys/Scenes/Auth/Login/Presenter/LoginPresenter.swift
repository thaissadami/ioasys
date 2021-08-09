//
//  LoginPresenter.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 16/07/20.
//  Copyright © 2020 ioasys. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import Foundation
import Domain

protocol LoginViewable: ViewLoadable {

    func showAlert(message: String)
}

protocol LoginSceneCoordinating {
    func showSearch()
}

class LoginPresenter {

    private weak var view: LoginViewable?
    private let coordinator: LoginSceneCoordinating
    private let formValidateUseCase: LoginFormValidateUseCaseProtocol
    private let authUseCase: AuthenticateUseCaseProtocol

    init(coordinator: LoginSceneCoordinating, formValidateUseCase: LoginFormValidateUseCaseProtocol,
         authUseCase: AuthenticateUseCaseProtocol) {
        self.coordinator = coordinator
        self.formValidateUseCase = formValidateUseCase
        self.authUseCase = authUseCase
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
                login(loginForm)
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
            view?.showAlert(message: "Campo de e-mail vazio")
        case .invalid:
            view?.showAlert(message: "E-mail inválido")
        }
    }

    private func handleBusinessPasswordError(_ error: LoginFormValidateUseCaseError.Password) {
        switch error {
        case .empty:
            view?.showAlert(message: "Campo de senha vazio")
        case .weak:
            view?.showAlert(message: "Senha fraca :(")
        }
    }
    
    func showSearch(){
        coordinator.showSearch()
    }
    
    private func login(_ form: LoginForm) {
        self.view?.showLoading()
        authUseCase.execute(form) { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.hideLoading()
            switch result {
            case .success:
                self.showSearch()
            case .failure(let error):
                self.view?.showAlert(message: error.localizedDescription)
            }
        }
    }
}
