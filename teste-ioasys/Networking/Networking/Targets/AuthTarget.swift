//
//  AuthTarget.swift
//  Networking
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import OxeNetworking
import Moya

public enum AuthTarget {
    case logIn(email: String, password: String)
}

extension AuthTarget: AppTarget {

    public var path: String {
        return "/users/auth/sign_in"
    }

    public var method: Moya.Method {
        switch self {
        case .logIn: return .post
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .logIn(let email, let password):
            let parameters = ["email": email, "password": password]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
