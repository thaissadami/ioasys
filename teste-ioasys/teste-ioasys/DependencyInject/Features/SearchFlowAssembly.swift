//
//  SearchFlowAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class SearchFlowAssembly: Assembly {

    func assemble(container: Container) {
        let homeCoordinator = container.resolveSafe(SearchCoordinator.self)

        //MARK: Home
        container.register(SearchSceneCoordinating.self) { _ in
            return homeCoordinator
        }
        container.autoregister(SearchViewPresenting.self, initializer: SearchPresenter.init)
    }
}
