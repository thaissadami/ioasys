//
//  SearchPresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation

protocol SearchViewable: ViewLoadable {
    func setCompanies()
    func showAlert(message: String)
}

protocol SearchSceneCoordinating {
    func showDetails()
}

class SearchPresenter {

    private weak var view: SearchViewable?
    private let coodinator: SearchSceneCoordinating

    init(coordinator: SearchSceneCoordinating) {
        self.coodinator = coordinator
    }

    func attach(_ view: SearchViewable) {
        self.view = view
    }

}

extension SearchPresenter: SearchViewPresenting {

    func getCompanies() {
        #warning("TODO - Integration")
        view?.showAlert(message: "TODO - Integration")
    }

    func showDetails() {
        coodinator.showDetails()
    }
}
