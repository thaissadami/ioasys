//
//  DataAssembly.swift
//  Training
//
//  Created by Itamar Silva on 22/07/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Swinject
import AppData
import Domain

class DataAssembly: Assembly {

    func assemble(container: Container) {

        container.autoregister(Domain.AuthRepositoryProtocol.self, initializer: AppData.AuthRepository.init)
    }
}
