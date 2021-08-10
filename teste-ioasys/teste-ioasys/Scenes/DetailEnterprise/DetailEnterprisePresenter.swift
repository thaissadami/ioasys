//
//  DetailEnterprisePresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

protocol DetailEnterpriseViewable: ViewLoadable {
    func getDetailEnterprise(idEnterprise: Int)
    func showAlert(message: String)
}

protocol DetailEnterpriseSceneCoordinating {
   
}

class DetailEnterprisePresenter {

    private weak var view: DetailEnterpriseViewable?
    private let coodinator: DetailEnterpriseSceneCoordinating

    init(coordinator: DetailEnterpriseSceneCoordinating) {
        self.coodinator = coordinator
    }

    func attach(_ view: DetailEnterpriseViewable) {
        self.view = view
    }

}

extension DetailEnterprisePresenter: DetailEnterpriseViewPresenting {

    func getDetailEnterprise(idEnterprise: Int) {
        view?.showAlert(message: "TODO - Integration")
    }

    func showDetails() {
        
    }
}

