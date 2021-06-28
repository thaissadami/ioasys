//
//  Investor.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//

import Foundation

class Investor: RequestModel {
    let id: Int?
    let email: String?
    let country: String?
    let firstAccess: Bool?
    let portfolio: Portfolio?
    let photo: String?
    let investorName: String?
    let superAngel: Bool?
    let city: String?
    let portfolioValue: Double?
    let balance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case country
        case firstAccess = "first_access"
        case portfolio
        case photo
        case investorName = "investor_name"
        case superAngel = "super_angel"
        case city
        case portfolioValue = "portfolio_value"
        case balance
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.firstAccess = try container.decodeIfPresent(Bool.self, forKey: .firstAccess)
        self.portfolio = try container.decodeIfPresent(Portfolio.self, forKey: .portfolio)
        self.photo = try container.decodeIfPresent(String.self, forKey: .photo)
        self.investorName = try container.decodeIfPresent(String.self, forKey: .investorName)
        self.superAngel = try container.decodeIfPresent(Bool.self, forKey: .superAngel)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.portfolioValue = try container.decodeIfPresent(Double.self, forKey: .portfolioValue)
        self.balance = try container.decodeIfPresent(Double.self, forKey: .balance)
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(firstAccess, forKey: .firstAccess)
        try container.encodeIfPresent(portfolio, forKey: .portfolio)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(investorName, forKey: .investorName)
        try container.encodeIfPresent(superAngel, forKey: .superAngel)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(portfolioValue, forKey: .portfolioValue)
        try container.encodeIfPresent(balance, forKey: .balance)
        try super.encode(to: encoder)
    }
}

struct Portfolio: Codable {
    var enterprises: [String]
    var enterprises_number: Int
}
