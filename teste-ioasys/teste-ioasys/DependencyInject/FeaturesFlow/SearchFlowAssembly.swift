//
//  SearchFlowAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class SearchFlowAssembly: Assembly {

    func assemble(container: Container) {
        let searchCoordinator = container.resolveSafe(SearchCoordinator.self)
        container.register(SearchSceneCoordinating.self) { _ in
            searchCoordinator
        }
        container.autoregister(SearchViewPresenting.self, initializer: SearchPresenter.init)
    }
}
