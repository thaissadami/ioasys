//
//  LoginForm.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

public struct LoginForm {

    public let email: String
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
