//
//  SearchPresenter.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation
import Domain

protocol SearchViewable: ViewLoadable {
    func showAlert(message: String)
    func setEnterprises()
}

protocol SearchSceneCoordinating {
    func showDetailEnterprise(_ enterprise: Enterprise)
}

class SearchPresenter {

    private weak var view: SearchViewable?
    private let coodinator: SearchSceneCoordinating
    private let enterprisesUseCase: EnterprisesUseCaseProtocol
    internal var resultEnterprises: [Enterprise] = []

    init(coordinator: SearchSceneCoordinating, enterprisesUseCase: EnterprisesUseCaseProtocol) {
        self.coodinator = coordinator
        self.enterprisesUseCase = enterprisesUseCase
    }

    func attach(_ view: SearchViewable) {
        self.view = view
    }
}

extension SearchPresenter: SearchViewPresenting {
    
    func showDetailEnterprise(_ enterprise: Enterprise) {
        coodinator.showDetailEnterprise(enterprise)
    }
    
    func getEnterprisesWithName(_ name: String) {
        let request = EnterprisesRequest(name: name)
        
        self.view?.showLoading()
        enterprisesUseCase.execute(request: request) { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.hideLoading()
            switch result {
            case .success:
                result.successHandler { response in
                    self.resultEnterprises = response.enterprises
                    self.view?.setEnterprises()
                }
            case .failure(let error):
                self.view?.showAlert(message: error.localizedDescription)
            }
        }
    }
}
