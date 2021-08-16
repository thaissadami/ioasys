//
//  AuthResponseDTO.swift
//  AppData
//
//  Created by Thais Sadami on 16/08/21.
//

import Domain

public struct AuthResponseDTO: Decodable {

    public let enterprise: String?
    public let investor: Investor
    public let success: Bool?

    public enum CodingKeys: String, CodingKey {
        case enterprise, investor, success
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enterprise = try container.decodeIfPresent(String.self, forKey: .enterprise)
        self.investor = try container.decode(Investor.self, forKey: .investor)
        self.success = try container.decode(Bool.self, forKey: .success)
    }

}

