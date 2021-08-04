//
//  DependencyFactory.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

protocol DependencyFactory: AnyObject {
    init(resolver: Resolver)
}

