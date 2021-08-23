//
//  SearchCoordinator.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import UIKit
import Domain

protocol SearchCoordinatorDelegate: AnyObject {
    func didShowDetailEnterprise(_ enterprise: Enterprise)
}

class SearchCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private weak var coordinatorDelegate: SearchCoordinatorDelegate?
    private let searchFactory: SearchFactory

    init(navigationController: UINavigationController, delegate: SearchCoordinatorDelegate, searchFactory: SearchFactory) {
        self.navigationController = navigationController
        self.coordinatorDelegate = delegate
        self.searchFactory = searchFactory
    }

    func start() {
        showSearch()
    }

    private func showSearch() {
        let searchViewController = searchFactory.makeSearchViewController()
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    public func showDetailEnterpriseScene(_ enterprise: Enterprise) {
        let detailEnterpriseViewController = searchFactory.makeDetailEnterpriseViewController()
        detailEnterpriseViewController.enterprise = enterprise
        navigationController.pushViewController(detailEnterpriseViewController, animated: true)
    }
}

extension SearchCoordinator: SearchSceneCoordinating {
    
    func showDetailEnterprise(_ enterprise: Enterprise) {
        showDetailEnterpriseScene(enterprise)
    }
}
