//
//  InvestorResponseDTO.swift
//  AppData
//
//  Created by Thais Sadami on 17/08/21.
//

import Domain

public struct InvestorResponseDTO: Codable {

    public let id: Int?
    public let email, country , investorName, photo, city: String?
    public let firstAccess, superAngel: Bool?
    public let portfolio: Portfolio?
    public let portfolioValue, balance: Double?

    public enum CodingKeys: String, CodingKey {
        case id, email, country, portfolio, photo, city, balance
        case firstAccess = "first_access"
        case investorName = "investor_name"
        case superAngel = "super_angel"
        case portfolioValue = "portfolio_value"
    }
}

extension InvestorResponseDTO {

    var toDomain: Investor {
        Investor(id: id, email: email, country: country, city: city, investorName: investorName, photo: photo, firstAccess: firstAccess, superAngel: superAngel, portfolio: portfolio, portfolioValue: portfolioValue, balance: balance)
    }
}

