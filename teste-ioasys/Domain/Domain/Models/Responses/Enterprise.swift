//
//  Enterprise.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation

public struct Enterprise {

    public let id: Int
    public let enterpriseName, photo, facebook, twitter, description, linkedin, city, country, emailEnterprise, phone: String
    public let value, sharePrice: Double
    public let ownEnterprise: Bool
    public let enterpriseTypeName:EnterpriseType

    public init(id: Int, enterpriseName: String, photo: String, facebook: String,
                twitter: String, description: String, linkedin: String, city: String,
                country: String, emailEnterprise: String, phone: String, value: Double, sharePrice: Double, ownEnterprise: Bool, enterpriseTypeName: EnterpriseType) {
        self.id = id
        self.enterpriseName = enterpriseName
        self.photo = photo
        self.value = value
        self.ownEnterprise = ownEnterprise
        self.enterpriseTypeName = enterpriseTypeName
        self.facebook = facebook
        self.twitter = twitter
        self.description = description
        self.linkedin = linkedin
        self.city = city
        self.country = country
        self.emailEnterprise = emailEnterprise
        self.phone = phone
        self.sharePrice = sharePrice
    }
}

//public class Enterprise: RequestModel {
//    let id: Int?
//    let enterpriseName, photo, facebook, twitter, description, linkedin, city, country, emailEnterprise, phone: String?
//    let value, sharePrice: Double?
//    let ownEnterprise: Bool?
//    let enterpriseTypeName:EnterpriseType?
//
//    public enum CodingKeys: String, CodingKey {
//        case id, photo, value, facebook, twitter, description, linkedin, city, country, phone
//        case enterpriseName = "enterprise_name"
//        case ownEnterprise = "own_enterprise"
//        case enterpriseTypeName = "enterprise_type_name"
//        case emailEnterprise = "email_enterprise"
//        case sharePrice = "share_price"
//    }
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
//        self.enterpriseName = try container.decodeIfPresent(String.self, forKey: .enterpriseName)
//        self.photo = try container.decodeIfPresent(String.self, forKey: .photo)
//        self.value = try container.decodeIfPresent(Double.self, forKey: .value)
//        self.ownEnterprise = try container.decodeIfPresent(Bool.self, forKey: .ownEnterprise)
//        self.enterpriseTypeName = try container.decodeIfPresent(EnterpriseType.self, forKey: .enterpriseTypeName)
//        self.facebook = try container.decodeIfPresent(String.self, forKey: .facebook)
//        self.twitter = try container.decodeIfPresent(String.self, forKey: .twitter)
//        self.description = try container.decodeIfPresent(String.self, forKey: .description)
//        self.linkedin = try container.decodeIfPresent(String.self, forKey: .linkedin)
//        self.city = try container.decodeIfPresent(String.self, forKey: .city)
//        self.country = try container.decodeIfPresent(String.self, forKey: .country)
//        self.emailEnterprise = try container.decodeIfPresent(String.self, forKey: .emailEnterprise)
//        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
//        self.sharePrice = try container.decodeIfPresent(Double.self, forKey: .sharePrice)
//
//        try super.init(from: decoder)
//    }
//
//    public override func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(id, forKey: .id)
//        try container.encodeIfPresent(enterpriseName, forKey: .enterpriseName)
//        try container.encodeIfPresent(photo, forKey: .photo)
//        try container.encodeIfPresent(value, forKey: .value)
//        try container.encodeIfPresent(ownEnterprise, forKey: .ownEnterprise)
//        try container.encodeIfPresent(enterpriseTypeName, forKey: .enterpriseTypeName)
//        try container.encodeIfPresent(facebook, forKey: .facebook)
//        try container.encodeIfPresent(twitter, forKey: .twitter)
//        try container.encodeIfPresent(description, forKey: .description)
//        try container.encodeIfPresent(linkedin, forKey: .linkedin)
//        try container.encodeIfPresent(city, forKey: .city)
//        try container.encodeIfPresent(country, forKey: .country)
//        try container.encodeIfPresent(emailEnterprise, forKey: .emailEnterprise)
//        try container.encodeIfPresent(phone, forKey: .phone)
//        try container.encodeIfPresent(sharePrice, forKey: .sharePrice)
//
//        try super.encode(to: encoder)
//    }
//}
//
public struct EnterpriseType: Codable {
    var enterprise_type_name: String
    var id: Int
}

