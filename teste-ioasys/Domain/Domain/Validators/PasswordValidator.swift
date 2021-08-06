//
//  PasswordValidator.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

enum PasswordValidator: Error {

    case input(String)
}

extension PasswordValidator: Validatable {

    var result: ValidationResult {
        switch self {
        case .input(let input):
            if input.isEmpty {
                return .failure(.empty)
            } else if input.count < 6 {
                return .failure(.invalid)
            }
            return .success(())
        }
    }
}

