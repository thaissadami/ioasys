//
//  CoordinatorAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class CoordinatorAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        let coordinatorFactory = container.resolveSafe(CoordinatorFactory.self)

        //MARK: App Coordinator
        container.register(AppCoordinator.self) { resolver in
            let appCoordinator = AppCoordinator(navigationController: self.navigationController,
                                                coordinatorFactory: coordinatorFactory)
            return appCoordinator
        }

        let appCoordinator = container.resolveSafe(AppCoordinator.self)

        //MARK: Authentication Coordinator
        container.register(AuthenticationCoordinator.self) { resolver in
            let authViewControllersFactory = resolver.resolveSafe(AuthenticationFactory.self)
            let authCoordinator = AuthenticationCoordinator(navigationController: appCoordinator.navigationController,
                                                            delegate: appCoordinator, authenticationFactory: authViewControllersFactory)
            return authCoordinator
        }

        //MARK: Search Coordinator
        container.register(SearchCoordinator.self) { resolver in
            let searchFactory = resolver.resolveSafe(SearchFactory.self)
            let searchCoordinator = SearchCoordinator(navigationController: appCoordinator.navigationController,
                                                  delegate: appCoordinator, searchFactory: searchFactory)
            return searchCoordinator
        }
    }
}



