//
//  AppCoordinator.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
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
    
    func showDetailEnterpriseFlow() {
        let detailEnterpriseCoordinator = coordinatorFactory.makeDetailEnterpriseCoordinator()
        detailEnterpriseCoordinator.start()
        childCoordinators.append(detailEnterpriseCoordinator)
    }

}

extension AppCoordinator: AuthenticationCoordinatorDelegate {

    func didAuthenticate() {
        showSearchFlow()
    }
}

//MARK: Search Coordinator Delegate

extension AppCoordinator: SearchCoordinatorDelegate {

    func didShowDetail() {
        showDetailEnterpriseFlow()
    }
}


