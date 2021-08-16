//
//  LoginRequest.swift
//  Domain
//
//  Created by Thais Sadami on 16/08/21.
//

import Domain

public struct LoginRequest: Encodable {

    public var email: String
    public var password: String

    init(from request: LoginRequest) {
        self.email = request.email
        self.password = request.password
    }

    public enum CodingKeys: String, CodingKey {
        case email, password
    }
}
