//
//  KeychainStorage.swift
//  Storage
//
//  Created by Jezreel Barbosa on 30/07/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation
import KeychainAccess

public class KeychainStorage: KeychainStoring {

    public var service: String?
    public var accessGroup: String?

    public init(service: String? = nil, accessGroup: String? = nil) {
        self.service = service
        self.accessGroup = accessGroup
    }

    public enum ValueKeyable: String, Keyable, CaseIterable {

        /// String
        case token
        case uid
        case client
        case email
        case password
        
        /// Data
        case investor

        public var key: String {
            return rawValue
        }
    }
}
