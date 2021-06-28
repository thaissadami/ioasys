//
//  Enterprise.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation

class Enterprise: RequestModel {
    let id: Int?
    let enterpriseName: String?
    let photo: String?
    let value: Double?
    let ownEnterprise: Bool?
    let enterpriseTypeName:EnterpriseType?
    let facebook: String?
    let twitter: String?
    let description: String?
    let linkedin: String?
    let city: String?
    let country: String?
    let emailEnterprise: String?
    let phone: String?
    let sharePrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case enterpriseName = "enterprise_name"
        case photo
        case value
        case ownEnterprise = "own_enterprise"
        case enterpriseTypeName = "enterprise_type_name"
        case facebook
        case twitter
        case description
        case linkedin
        case city
        case country
        case emailEnterprise = "email_enterprise"
        case phone
        case sharePrice = "share_price"
        
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.enterpriseName = try container.decodeIfPresent(String.self, forKey: .enterpriseName)
        self.photo = try container.decodeIfPresent(String.self, forKey: .photo)
        self.value = try container.decodeIfPresent(Double.self, forKey: .value)
        self.ownEnterprise = try container.decodeIfPresent(Bool.self, forKey: .ownEnterprise)
        self.enterpriseTypeName = try container.decodeIfPresent(EnterpriseType.self, forKey: .enterpriseTypeName)
        self.facebook = try container.decodeIfPresent(String.self, forKey: .facebook)
        self.twitter = try container.decodeIfPresent(String.self, forKey: .twitter)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.linkedin = try container.decodeIfPresent(String.self, forKey: .linkedin)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.emailEnterprise = try container.decodeIfPresent(String.self, forKey: .emailEnterprise)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.sharePrice = try container.decodeIfPresent(Double.self, forKey: .sharePrice)
        
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(enterpriseName, forKey: .enterpriseName)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(ownEnterprise, forKey: .ownEnterprise)
        try container.encodeIfPresent(enterpriseTypeName, forKey: .enterpriseTypeName)
        try container.encodeIfPresent(facebook, forKey: .facebook)
        try container.encodeIfPresent(twitter, forKey: .twitter)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(linkedin, forKey: .linkedin)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(emailEnterprise, forKey: .emailEnterprise)
        try container.encodeIfPresent(phone, forKey: .phone)
        try container.encodeIfPresent(sharePrice, forKey: .sharePrice)
 
        try super.encode(to: encoder)
    }
}

struct EnterpriseType: Codable {
    var enterprise_type_name: String
    var id: Int
}

