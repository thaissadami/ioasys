//
//  EnterpriseResponse.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 28/06/21.
//

import Foundation
import Domain

public struct EnterpriseResponse {
    public let enterprise: Enterprise
    public let success: Bool

    enum CodingKeys: String, CodingKey {
        case enterprise, success
    }
    
    public init(enterprise: Enterprise, success: Bool) {
        self.enterprise = enterprise
        self.success = success
    }
}
    
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.enterprise = try container.decodeIfPresent(Enterprise.self, forKey: .enterprise)
//        self.success = try container.decodeIfPresent(Bool.self, forKey: .success)
//
//        try super.init(from: decoder)
//    }
//
//    public override func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(enterprise, forKey: .enterprise)
//        try container.encodeIfPresent(success, forKey: .success)
//        try super.encode(to: encoder)
//    }
//}

//class EnterpriseResponse: RequestModel {
//    let enterprise: Enterprise?
//    let success: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case enterprise
//        case success
//    }
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.enterprise = try container.decodeIfPresent(Enterprise.self, forKey: .enterprise)
//        self.success = try container.decodeIfPresent(Bool.self, forKey: .success)
//
//        try super.init(from: decoder)
//    }
//
//    override func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(enterprise, forKey: .enterprise)
//        try container.encodeIfPresent(success, forKey: .success)
//        try super.encode(to: encoder)
//    }
//}
