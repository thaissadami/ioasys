//
//  Investor.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//

import Foundation

public struct Investor: Codable {
    public let id: Int
    public let investorName, email, city, country, photo: String
    public let superAngel, firstAccess: Bool
    public let portfolioValue, balance: Double
    public let portfolio: Portfolio

    public init(investorName: String, email: String, city: String, country: String, id: Int, photo: String, superAngel: Bool, firstAccess: Bool, portfolioValue: Double, balance: Double, portfolio: Portfolio) {
        self.id = id
        self.investorName = investorName
        self.email = email
        self.city = city
        self.country = country
        self.photo = photo
        self.superAngel = superAngel
        self.firstAccess = firstAccess
        self.portfolioValue = portfolioValue
        self.balance = balance
        self.portfolio = portfolio
    }

    enum CodingKeys: String, CodingKey {
        case id, email, country, portfolio, photo, city, balance
        case firstAccess = "first_access"
        case investorName = "investor_name"
        case superAngel = "super_angel"
        case portfolioValue = "portfolio_value"
    }
}

public struct Portfolio: Codable {
    var enterprises: [String]
    var enterprises_number: Int
}
