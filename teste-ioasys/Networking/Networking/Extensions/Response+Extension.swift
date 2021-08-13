//
//  Response+Extension.swift
//  Networking
//
//  Created by Jezreel Barbosa on 07/08/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Moya

extension Response {

    func response(encoding: String.Encoding) -> Response {
        let utf8Data = String(data: data, encoding: encoding)?.data(using: .utf8)
        return Response(statusCode: statusCode, data: utf8Data!, request: request, response: response)
    }

    func hasReturnCodeSuccess() -> Bool {
        returnCode() == 0 || returnCode() == 35
    }

    func returnCode() -> Int? {
        try? self.map(Int.self, atKeyPath: "codigoDeRetorno")
    }

    func isRequestSuccess() throws -> Bool {
        try self.map(Bool.self, atKeyPath: "success")
    }
}
