//
//  LoginManager.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 24/06/21.
//

import Foundation

enum LoginState {
    case emailEmpty
    case passwordEmpty
    case invalidCredentials
}

class LoginManager {
    
    var loginViewController: LoginViewController
    var email: String?
    var password: String?
    
    var state: LoginState = .cpfEmpty {
        didSet {
            switch state {
            case .emailEmpty:
                self.setupCpfEmpty()
            case .passwordEmpty:
                self.setupCpfTryAgain()
            case .invalidCredentials:
                self.setupPasswordEmpty()
            }
        }
    }
    
    init(loginController: LoginViewController) {
        self.loginViewController = loginController
    }
}
