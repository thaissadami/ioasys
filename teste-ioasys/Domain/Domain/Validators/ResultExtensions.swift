//
//  ResultExtensions.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

public extension Swift.Result {

    /// Returns the value if self represents a success, `nil` otherwise.
    var success: Success? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }

    /// Returns the error if self represents a failure, `nil` otherwise.
    var failure: Failure? {
        switch self {
        case .success:
            return nil
        case let .failure(error):
            return error
        }
    }
}
