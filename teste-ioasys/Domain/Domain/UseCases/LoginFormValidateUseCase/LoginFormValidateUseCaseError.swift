//
//  LoginFormValidateUseCaseError.swift
//  Domain
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
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
