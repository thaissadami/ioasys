//
//  AppCoordinator.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import UIKit

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let coordinatorFactory: CoordinatorFactory

    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }

    public func start() {
        showAuthenticationFlow()
    }

    func showAuthenticationFlow() {
        let authenticateCoordinator = coordinatorFactory.makeAuthenticateCoordinator()
        authenticateCoordinator.start()
        childCoordinators.append(authenticateCoordinator)
    }

    func showSearchFlow() {
        let searchCoordinator = coordinatorFactory.makeSearchCoordinator()
        searchCoordinator.start()
        childCoordinators.append(searchCoordinator)
    }

}

extension AppCoordinator: AuthenticationCoordinatorDelegate {

    func didAuthenticate() {
        showSearchFlow()
    }
}

//MARK: Home Coordinator Delegate

extension AppCoordinator: SearchCoordinatorDelegate {

    func didLogout() {
        #warning("TODO - ")
    }
}


