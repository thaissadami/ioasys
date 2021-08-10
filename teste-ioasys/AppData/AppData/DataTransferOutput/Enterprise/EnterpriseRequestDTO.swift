//
//  CompaniesRequestDTO.swift
//  AppData
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public struct EnterpriseRequestDTO: Encodable {

    public let idEnterprise: Int

    public init(idEnterprise: Int) {
        self.idEnterprise = idEnterprise
    }

    public enum CodingKeys: String, CodingKey {
        case idEnterprise = "id"
    }
}
