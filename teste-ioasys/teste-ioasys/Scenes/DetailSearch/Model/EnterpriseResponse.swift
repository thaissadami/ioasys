//
//  EnterpriseResponse.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 28/06/21.
//

import Foundation

class EnterpriseResponse: RequestModel {
    let enterprise: Enterprise?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case enterprise
        case success
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enterprise = try container.decodeIfPresent(Enterprise.self, forKey: .enterprise)
        self.success = try container.decodeIfPresent(Bool.self, forKey: .success)
        
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterprise, forKey: .enterprise)
        try container.encodeIfPresent(success, forKey: .success)
        try super.encode(to: encoder)
    }
}
