//
//  APIEnvironment.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 27/06/21.
//

import Foundation


#if DEBUG
//let environment = APIEnvironment.development
#else
//let environment = APIEnvironment.production
#endif

let baseURL = APIEnvironment.production.baseURL()

enum APIEnvironment {
//    case development
    case production
    
    func baseURL () -> String {
        return "https://\(domain())"
    }
    
    func baseURLAPI () -> String {
        return "https://\(domain())\(route())"
    }
    
    func domain() -> String {
        switch self {
//        case .development:
//            return "empresas.ioasys.com.br"
        case .production:
            return "empresas.ioasys.com.br"
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}

