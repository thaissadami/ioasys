//
//  LoginFormValidateUseCaseError.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

public enum LoginFormValidateUseCaseError: Error {

    public enum Email {
        case empty
        case invalid
    }

    public enum Password {
        case empty
        case weak
    }

    case email(Email)
    case password(Password)
}
