//
//  PasswordValidator.swift
//  Domain
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
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

