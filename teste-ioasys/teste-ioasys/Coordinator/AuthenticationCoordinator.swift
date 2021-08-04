//
//  AuthenticationCoordinatorDelegate.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import UIKit

protocol AuthenticationCoordinatorDelegate: CoordinatorDelegate {
    func didAuthenticate()
}

class AuthenticationCoordinator: Coordinator {

    weak var coordinatorDelegate: AuthenticationCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let authenticationFactory: AuthenticationFactory

    init(navigationController: UINavigationController, delegate: AuthenticationCoordinatorDelegate,
         authenticationFactory: AuthenticationFactory) {

        self.navigationController = navigationController
        self.coordinatorDelegate = delegate
        self.authenticationFactory = authenticationFactory
    }

    public func start() {
        let loginViewController = authenticationFactory.makeLoginViewController()
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
}

extension AuthenticationCoordinator: LoginSceneCoordinating {

    func showSearch() {
        coordinatorDelegate?.didAuthenticate()
    }
}
