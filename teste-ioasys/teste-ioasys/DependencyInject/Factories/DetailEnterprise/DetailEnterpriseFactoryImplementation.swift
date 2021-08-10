//
//  DetailEnterpriseFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 10/08/21.
//

import Swinject

class DetailEnterpriseFactoryImplementation: DetailEnterpriseFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makeDetailEnterpriseViewController() -> DetailEnterpriseViewController {
        guard let detailEnterprisePresenter = resolver.resolve(DetailEnterpriseViewPresenting.self) as? DetailEnterprisePresenter else {
            preconditionFailure("Cloudn't resolve DetailEnterpriseViewPresenting")
        }

        let detailEnterpriseViewController = DetailEnterpriseViewController(presenter: detailEnterprisePresenter)
        detailEnterprisePresenter.attach(detailEnterpriseViewController)

        return detailEnterpriseViewController
    }

}
