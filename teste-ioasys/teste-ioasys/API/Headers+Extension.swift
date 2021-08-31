//
//  Headers.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 31/08/21.
//

import Foundation
import Request

extension Headers {

    //iOS 13
//    @RequestBuilder
//    static func Default() -> some RequestType {
//        Timeout(30, for: .request)
//
//        Headers.Accept(.json)
//        Headers.ContentType(.json)
//    }

    func DefaultHeaders() -> AnyRequest {
        Group {
            Headers.ContentType(.json)
            Headers.Accept(.json)
        }
        .eraseToAnyRequest()
    }

}

