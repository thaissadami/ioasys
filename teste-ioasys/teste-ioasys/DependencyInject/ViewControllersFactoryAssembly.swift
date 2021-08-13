//
//  ViewControllersFactoryAssembly.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import Swinject

class ViewControllersFactoryAssembly: Assembly {
 
    func assemble(container: Container) {

        container.register(AuthenticationFactory.self) { resolver in
            return AuthenticationFactoryImplementation(resolver: resolver)
        }

        container.register(SearchFactory.self) { resolver in
            return SearchFactoryImplementation(resolver: resolver)
        }
        
        container.register(DetailEnterpriseFactory.self) { resolver in
            return DetailEnterpriseFactoryImplementation(resolver: resolver)
        }
    }
}
