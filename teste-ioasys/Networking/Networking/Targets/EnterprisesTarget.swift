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

    case enterprisesList(HeaderEnterprisesRequestDTO, EnterprisesRequestDTO)
}

extension EnterprisesTarget: AppTarget {

    var path: String {
        "/enterprises"
    }

    var method: Moya.Method {
        switch self {
        case .enterprisesList: return .get
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .enterprisesList(_, let request):
            return .requestPercentParameters(parameters: request.parameters, encoding: QueryArrayEncoding.default)
        }
    }

    public var headers: Headers {
        switch self {
        case .enterprisesList(let header, _):
            return ["Content-Type": "application/json", "access-token": header.token, "uid": header.uid, "client": header.client]
        }
    }
}

