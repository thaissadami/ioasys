//
//  ViewControllersFactoryAssembly.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

class ViewControllersFactoryAssembly: Assembly {
 
    func assemble(container: Container) {

        container.register(AuthenticationFactory.self) { resolver in
            return AuthenticationFactoryImplementation(resolver: resolver)
        }

        //MARK: Search Factory
        container.register(SearchFactory.self) { resolver in
            return SearchFactoryImplementation(resolver: resolver)
        }
    }
}
