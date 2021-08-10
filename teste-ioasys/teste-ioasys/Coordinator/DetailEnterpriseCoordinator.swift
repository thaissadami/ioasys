//
//  SearchDetailCoordinator.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 10/08/21.
//

import UIKit

protocol DetailEnterpriseCoordinatorDelegate: AnyObject {

}

class DetailEnterpriseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private weak var coordinatorDelegate: DetailEnterpriseCoordinatorDelegate?
    private let detailEnterpriseFactory: DetailEnterpriseFactory

    init(navigationController: UINavigationController, delegate: DetailEnterpriseCoordinatorDelegate, detailEnterpriseFactory: DetailEnterpriseFactory) {
        self.navigationController = navigationController
        self.coordinatorDelegate = delegate
        self.detailEnterpriseFactory = detailEnterpriseFactory
    }

    func start() {
        showSearch()
    }

    private func showSearch() {
        let detailEnterpriseViewController = detailEnterpriseFactory.makeDetailEnterpriseViewController()
        navigationController.pushViewController(detailEnterpriseViewController, animated: true)
    }
}

//extension SearchDetailCoordinator: SearchDetailSceneCoordinating {
//    func showDetails() {
//        coordinatorDelegate?.didShowDetail()
//    }
//}
