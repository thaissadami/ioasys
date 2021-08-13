//
//  LoginResponse.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//
import Foundation

public class LoginResponse: RequestModel {
    public let enterprise: String?
    public let investor: Investor
    public let success: Bool?

    public enum CodingKeys: String, CodingKey {
        case enterprise, investor, success
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enterprise = try container.decodeIfPresent(String.self, forKey: .enterprise)
        self.investor = try container.decode(Investor.self, forKey: .investor)
        self.success = try container.decode(Bool.self, forKey: .success)
        
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterprise, forKey: .enterprise)
        try container.encodeIfPresent(investor, forKey: .investor)
        try container.encodeIfPresent(success, forKey: .success)
        try super.encode(to: encoder)
    }
}
