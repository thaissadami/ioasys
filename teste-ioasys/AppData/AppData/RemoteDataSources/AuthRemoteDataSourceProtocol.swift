//
//  AuthRemoteDataSourceProtocol.swift
//  AppData
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain

public protocol AuthRemoteDataSourceProtocol: Any {

    func login(_ form: LoginForm, completion: @escaping (Result<LoginResponse, Error>) -> ())
}
