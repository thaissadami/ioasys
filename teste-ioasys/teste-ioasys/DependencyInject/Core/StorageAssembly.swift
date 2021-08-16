//
//  StorageAssembly.swift
//  Training
//
//  Created by Itamar Silva on 22/07/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Swinject
import AppData
import Storage

class StorageAssembly: Assembly {

    func assemble(container: Container) {

        container.autoregister(AppData.AuthLocalDataSourceProtocol.self, initializer: Storage.AuthLocalDataSource.init)
        container.register(KeychainStorage.self) { _ in KeychainStorage() }
        container.register(UserDefaultsStorage.self) { _ in UserDefaultsStorage(userDefaults: .standard) }
    }
}
