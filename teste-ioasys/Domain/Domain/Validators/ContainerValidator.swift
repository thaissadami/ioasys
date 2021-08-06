//
//  ContainerValidator.swift
//  Domain
//
//  Created by Thais Sadami on 05/08/21.
//

import Foundation

protocol ContainerValidatable {

    var isValid: Bool { get }
}

class ContainerValidator {

    private let validators: [Validatable]

    init(validators: [Validatable]) {
        self.validators = validators
    }

}

extension ContainerValidator: ContainerValidatable {

    var isValid: Bool {
        return validators.compactMap({ $0.result.failure }).isEmpty
    }
}
