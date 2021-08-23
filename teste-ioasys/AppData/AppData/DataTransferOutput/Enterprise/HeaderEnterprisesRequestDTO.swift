//
//  HeaderEnterprisesRequestDTO.swift
//  AppData
//
//  Created by Thais Sadami on 17/08/21.
//

import Foundation

public struct HeaderEnterprisesRequestDTO: Codable {

    public let token: String
    public let uid: String
    public let client: String

    public init(token: String, uid: String, client: String) {
        self.token = token
        self.uid = uid
        self.client = client
    }

    public enum CodingKeys: String, CodingKey {
        case token = "access-token"
        case uid, client
    }
}
