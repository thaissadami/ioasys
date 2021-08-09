//
//  LoginFormValidateUseCaseProtocol.swift
//  Domain
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

public protocol LoginFormValidateUseCaseProtocol: AnyObject {

    func execute(_ form: LoginForm, completion: (Result<Void, LoginFormValidateUseCaseError>) -> ())
}
