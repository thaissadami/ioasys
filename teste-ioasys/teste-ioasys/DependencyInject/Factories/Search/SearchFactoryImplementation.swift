//
//  SearchFactoryImplementation.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
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
}
