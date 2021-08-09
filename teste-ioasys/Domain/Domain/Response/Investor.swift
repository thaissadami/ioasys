//
//  Investor.swift
//  Domain
//
//  Created by Thais Sadami on 06/08/21.
//

import Foundation

public struct Investor: Codable {
    public let id: Int
    public let investorName, email, city, country: String

    public init(investorName: String, email: String, city: String, country: String, id: Int) {
        self.investorName = investorName
        self.email = email
        self.city = city
        self.country = country
        self.id = id
    }

    enum CodingKeys: String, CodingKey {
        case id
        case investorName = "investor_name"
        case email, city, country
    }
}
