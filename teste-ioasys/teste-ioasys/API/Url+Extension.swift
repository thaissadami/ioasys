//
//  UrlIoasys.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 31/08/21.
//

import Foundation
import Request

extension Url{
    static func Project() -> Url {
        Url(.https, path: "empresas.ioasys.com.br/api")
    }

    static var versionAPI: Url {
        .init("/v1")
    }

    static var userAPI: Url {
        .init("/user")
    }

}
