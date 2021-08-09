//
//  SearchFlowAssembly.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
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
