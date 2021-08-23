//
//  AppTarget.swift
//  Networking
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Moya
import OxeNetworking

public protocol AppTarget: SampleHeadersReturning, HigherLayerHeadersSpecifyable, KeyPathable {}

extension AppTarget {

    public var baseURL: URL {
        return URL(string: "https://empresas.ioasys.com.br/api/v1/")!
    }

    public var specificHeaderTypes: [HeaderSpecifying] {
        return []
    }

    public var keyPathForData: String? {
        return nil
    }

    public var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    public var headers: Headers {
        return nil
    }
}

