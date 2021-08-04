//
//  DependencyInjector.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class DependencyInjector {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }


    func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> ()) {
        // dependency inject -> BOTTOM - UP (baixo nível para alto nível)
        let assembler = Assembler([
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(navigationController: self.navigationController),
            AuthenticationFlowAssembly(),
            SearchFlowAssembly()
        ])
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }

}
