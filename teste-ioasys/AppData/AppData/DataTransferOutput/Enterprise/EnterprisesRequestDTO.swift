//
//  EnterprisesRequestDTO.swift
//  AppData
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public struct EnterprisesRequestDTO: Encodable {

    public let name: String

    public init(name: String) {
        self.name = name
    }

    public enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
