//
//  SearchDetailFactory.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 10/08/21.
//

import Swinject

protocol DetailEnterpriseFactory: DependencyFactory {

    func makeDetailEnterpriseViewController() -> DetailEnterpriseViewController
}
