//
//  Validatable.swift
//  Domain
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

enum FormValidationError: Error {
    case empty
    case invalid
}

typealias ValidationResult = Result<Void, FormValidationError>

protocol Validatable {

    var result: ValidationResult { get }
}
