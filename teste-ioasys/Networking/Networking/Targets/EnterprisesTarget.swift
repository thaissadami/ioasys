//
//  EnterprisesTarget.swift
//  Networking
//
//  Created by Thais Sadami on 11/08/21.
//

import AppData
import OxeNetworking
import Moya

enum EnterprisesTarget {

    case enterprisesList(EnterprisesRequestDTO)
}

extension EnterprisesTarget: AppTarget {

    var path: String {
        "enterprise"
    }

    var method: Moya.Method {
        .post
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .enterprisesList(let request):
            return .requestPercentParameters(parameters: request.parameters, encoding: QueryArrayEncoding.default)
        }
    }

    public var headers: Headers {
        switch self {
        case .enterprisesList:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        }
    }
}

