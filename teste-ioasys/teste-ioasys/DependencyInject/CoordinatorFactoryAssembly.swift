//
//  CoordinatorFactoryAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {

        container.register(CoordinatorFactory.self) { resolver in
            return CoordinatorFactoryImplementation(resolver: resolver)
        }
    }
}
