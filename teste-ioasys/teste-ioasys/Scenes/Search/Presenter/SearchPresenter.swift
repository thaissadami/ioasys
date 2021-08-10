//
//  SearchPresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation
import Domain

protocol SearchViewable: ViewLoadable {
    func setCompanies()
    func showAlert(message: String)
}

protocol SearchSceneCoordinating {
    func showCompanies()
}

class SearchPresenter {

    private weak var view: SearchViewable?
    private let coodinator: SearchSceneCoordinating
    private let getCompaniesUseCase: GetCompaniesUseCaseProtocol

    init(coordinator: SearchSceneCoordinating) {
        self.coodinator = coordinator
    }

    func attach(_ view: SearchViewable) {
        self.view = view
    }
}

extension SearchPresenter: SearchViewPresenting {
    
    func getCompanies() {
        self.view?.showLoading()
        getCompaniesUseCase.execute() { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.hideLoading()
            switch result {
            case .success:
                self.showCompanies()
            case .failure(let error):
                self.view?.showAlert(message: error.localizedDescription)
            }
        }
    }

    func showCompanies() {
        coodinator.showCompanies()
    }
}
