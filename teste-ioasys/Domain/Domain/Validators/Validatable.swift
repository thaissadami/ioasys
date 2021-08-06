//
//  Validatable.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
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
