//
//  EnterprisesUseCase.swift
//  Domain
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public protocol EnterprisesUseCaseProtocol: AnyObject {

    func execute(request: EnterpriseRequest, completion: @escaping (Result<SearchResponse, Error>) -> ())
}

public class EnterprisesUseCase {
    
    private let repository: EnterprisesRepositoryProtocol

    public init(repository: EnterprisesRepositoryProtocol) {
        self.repository = repository
    }
}

extension EnterprisesUseCase: EnterprisesUseCaseProtocol {
    
    public func execute(request: EnterpriseRequest, completion: @escaping (Result<SearchResponse, Error>) -> ()) {
        repository.getEnterprisesWithName(request: request, completion: completion)
    }
}
