//
//  TestResponse.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 31/08/21.
//

import Foundation

public struct TestResponse: Decodable {
    let enterprise: String?
    var investor: Investor?
    var success: Bool?

    enum CodingKeys: String, CodingKey {
        case enterprise
        case investor
        case success
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.enterprise = try container.decode(String.self, forKey: .enterprise)
        self.investor = try container.decode(Investor.self, forKey: .investor)
        self.success = try container.decode(Bool.self, forKey: .success)
    }
}
