//
//  ResolverExtension.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Swinject

extension Resolver {
    public func resolveSafe<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType, name: nil) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return dependency
    }

    func resolveSafe<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = resolve(serviceType, argument: argument) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return service
    }
}
