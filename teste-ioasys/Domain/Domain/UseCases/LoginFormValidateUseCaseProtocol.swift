//
//  LoginFormValidateUseCaseProtocol.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

public protocol LoginFormValidateUseCaseProtocol: AnyObject {

    func execute(_ form: LoginForm, completion: (Result<Void, LoginFormValidateUseCaseError>) -> ())
}
