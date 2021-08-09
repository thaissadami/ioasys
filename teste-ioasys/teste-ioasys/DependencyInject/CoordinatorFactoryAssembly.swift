//
//  CoordinatorFactoryAssembly.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {

        container.register(CoordinatorFactory.self) { resolver in
            return CoordinatorFactoryImplementation(resolver: resolver)
        }
    }
}
