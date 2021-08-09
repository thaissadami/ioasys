//
//  SetupContants.swift
//  DMCard
//
//  Created by Adriano Dias on 26/04/19.
//  Copyright © 2019 dias. All rights reserved.
//

import Foundation
import Networking
import OxeNetworking
import Alamofire
import Moya

enum FixturesType: String, FixtureTypeSpecifying {
    case development, json, none

    public var isEnabled: Bool {
        return self != .none
    }

    public var isJsonType: Bool {
        return self == .json
    }
}

enum EnvironmentType: String, EnvironmentSpecifying {
    case development, production, store

    public var name: String {
        return rawValue
    }

    public var baseURL: URL? {
        return URL(string: "https://empresas.ioasys.com.br/api/v1")
    }

    public var mayBeSimulated: Bool {
        return false
    }
}

struct SetupConstants {

    static let commonHeaders: Headers = ["accept": "application/json"]
    static let type: EnvironmentType = .development
    static let defaultFixturesType: FixturesType = .none
    static let _environment = Environment(type: type, fixturesType: defaultFixturesType, commonHeaders: commonHeaders)
    static let environment = Environment.init(type: type, fixturesType: defaultFixturesType,
                                              serverTrustManager: ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [:]))
}
