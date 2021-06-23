//
//  User.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation

class Credential: RequestModel {
    let email: String?
    let password: String?

    enum CodingKeys: String, CodingKey {
        case email
        case password
    }

    init(email: String?, password: String?) {
        self.email = email
        self.password = password
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.password = try container.decodeIfPresent(String.self, forKey: .password)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(password, forKey: .password)
        try super.encode(to: encoder)
    }
}

//struct User : Codable{
//    var email: String = ""
//    var password: String = ""
//}
