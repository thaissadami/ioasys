//
//  CompaniesResponseDTO.swift
//  AppData
//
//  Created by Thais Sadami on 10/08/21.
//

import Domain

public struct EnterprisesResponseDTO: Decodable {
    
    public let id: Int
    public let enterpriseName, photo, facebook, twitter, description, linkedin, city, country, emailEnterprise, phone: String
    public let value, sharePrice: Double
    public let ownEnterprise: Bool
    public let enterpriseTypeName:EnterpriseType

    public enum CodingKeys: String, CodingKey {
        case id, photo, value, facebook, twitter, description, linkedin, city, country, phone
        case enterpriseName = "enterprise_name"
        case ownEnterprise = "own_enterprise"
        case enterpriseTypeName = "enterprise_type_name"
        case emailEnterprise = "email_enterprise"
        case sharePrice = "share_price"
    }

    var toDomain: Enterprise {
        Enterprise(id: id, enterpriseName: enterpriseName, photo: photo, facebook: facebook, twitter: twitter, description: description, linkedin: linkedin, city: city, country: country, emailEnterprise: emailEnterprise, phone: phone, value: value, sharePrice: sharePrice, ownEnterprise: ownEnterprise, enterpriseTypeName: enterpriseTypeName)
    }
}
