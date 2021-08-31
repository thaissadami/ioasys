//
//  AccessToken.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 30/08/21.
//

import Foundation
import Request

struct AccessToken: RequestType {

    func buildRequest(_ request: inout URLRequest) {
        request.setValue("", forHTTPHeaderField: "access-token")
    }
}
