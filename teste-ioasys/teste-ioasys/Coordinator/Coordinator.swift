//
//  Coordinator.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import UIKit
import Swinject

protocol CoordinatorDelegate: class {

    func coordinatorDidExit(_ coordinator: Coordinator)
}

protocol Coordinator: CoordinatorDelegate {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    func start()

}

extension Coordinator {

    public func coordinatorDidExit(_ coordinator: Coordinator) {

        guard let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        self.childCoordinators.remove(at: index)

    }
}

