//
//  HeaderEnterprisesRequest.swift
//  Domain
//
//  Created by Thais Sadami on 17/08/21.
//

import Foundation

public struct HeaderEnterprisesRequest {
    
    public var token: String
    public var uid: String
    public var client: String

    public init(token: String, uid: String, client: String) {
        self.token = token
        self.uid = uid
        self.client = client
    }

    public enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case uid, client
    }
}
