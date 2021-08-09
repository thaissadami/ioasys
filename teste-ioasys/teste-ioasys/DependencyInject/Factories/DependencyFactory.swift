//
//  DependencyFactory.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Swinject

protocol DependencyFactory: AnyObject {
    init(resolver: Resolver)
}

