//
//  CoordinatorFactory.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

protocol CoordinatorFactory: DependencyFactory {

    func makeAuthenticateCoordinator() -> AuthenticationCoordinator
    func makeSearchCoordinator() -> SearchCoordinator
}
