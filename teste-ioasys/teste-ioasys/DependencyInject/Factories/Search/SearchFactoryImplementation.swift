//
//  SearchFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import Swinject

class SearchFactoryImplementation: SearchFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makeSearchViewController() -> SearchViewController {
        guard let searchPresenter = resolver.resolve(SearchViewPresenting.self) as? SearchPresenter else {
            preconditionFailure("Cloudn't resolve SearchViewPresenting")
        }

        let searchViewController = SearchViewController(presenter: searchPresenter)
        searchPresenter.attach(searchViewController)

        return searchViewController
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
