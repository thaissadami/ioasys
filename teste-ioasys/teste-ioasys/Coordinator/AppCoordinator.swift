//
//  AppCoordinator.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import UIKit
import Domain

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
    
    func showDetailEnterpriseFlow(_ enterprise: Enterprise) {
        let detailEnterpriseCoordinator = coordinatorFactory.makeSearchCoordinator()
        detailEnterpriseCoordinator.showDetailEnterprise(enterprise)
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
    func didShowDetailEnterprise(_ enterprise: Enterprise) {
        showDetailEnterpriseFlow(enterprise)
    }
}


