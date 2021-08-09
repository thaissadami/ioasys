//
//  SearchCoordinator.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import UIKit

protocol SearchCoordinatorDelegate: AnyObject {
    func didShowDetail()
}

class SearchCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private weak var delegate: SearchCoordinatorDelegate?
    private let searchFactory: SearchFactory

    init(navigationController: UINavigationController, delegate: SearchCoordinatorDelegate, searchFactory: SearchFactory) {
        self.navigationController = navigationController
        self.delegate = delegate
        self.searchFactory = searchFactory
    }

    func start() {
        showSearch()
    }

    private func showSearch() {
        let searchViewController = searchFactory.makeSearchViewController()
        navigationController.pushViewController(searchViewController, animated: true)
    }
}

extension SearchCoordinator: SearchSceneCoordinating {
    func showDetails() {
        #warning("TODO")
    }
}
