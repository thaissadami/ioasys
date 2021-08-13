//
//  Result+Extension.swift
//  Domain
//
//  Created by Jezreel Barbosa on 03/07/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation

public typealias ResultCompletion<T> = (_ result: Swift.Result<T, Error>) -> Void

public extension Swift.Result {
    var isSuccess: Bool {
        switch self {
        case .success: return true
        case .failure: return false
        }
    }

    var isFailure: Bool {
        switch self {
        case .success: return false
        case .failure: return true
        }
    }

    @discardableResult func successHandler(_ handler: (Success) -> Void) -> Self {
        if case let .success(value) = self {
            handler(value)
        }
        return self
    }

    @discardableResult func failureHandler(_ handler: (Failure) -> Void) -> Self {
        if case let .failure(error) = self {
            handler(error)
        }
        return self
    }
}
