//
//  DependencyInjector.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import OxeNetworking

class DependencyInjector {

    private let navigationController: UINavigationController
    private let environment : Environment

    init(navigationController: UINavigationController, environment: Environment) {
        self.navigationController = navigationController
        self.environment = environment
    }


    func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> ()) {
        // dependency inject -> BOTTOM - UP (baixo nível para alto nível)
        let assembler = Assembler([
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(navigationController: self.navigationController),
            AuthenticationFlowAssembly(),
            SearchFlowAssembly(),
            DomainAssembly(),
            DataAssembly(),
            NetworkingAssembly(environment: environment),
            StorageAssembly()
        ])
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }

}
