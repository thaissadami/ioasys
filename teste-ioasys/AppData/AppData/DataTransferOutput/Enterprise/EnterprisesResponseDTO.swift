//
//  EnterprisesResponseDTO.swift
//  AppData
//
//  Created by Thais Sadami on 10/08/21.
//

import Domain

public struct EnterprisesResponseDTO: Decodable {
    
    public let id: Int
    public let enterpriseName, photo, description, city, country: String
    public let facebook, twitter, linkedin, emailEnterprise, phone: String?
    public let value, sharePrice: Double
    public let ownEnterprise: Bool
    public let enterpriseType:EnterpriseType

    public enum CodingKeys: String, CodingKey {
        case id, photo, value, description, city, country
        case enterpriseName = "enterprise_name"
        case ownEnterprise = "own_enterprise"
        case enterpriseType = "enterprise_type"
        case sharePrice = "share_price"
        
        case emailEnterprise = "email_enterprise"
        case facebook, twitter, linkedin, phone
    }

    var toDomain: Enterprise {
        Enterprise(id: id, enterpriseName: enterpriseName, photo: photo, description: description, city: city, country: country, value: value, sharePrice: sharePrice, ownEnterprise: ownEnterprise, facebook: facebook, twitter: twitter, linkedin: linkedin, emailEnterprise: emailEnterprise, phone: phone, enterpriseType: enterpriseType)
    }
}


