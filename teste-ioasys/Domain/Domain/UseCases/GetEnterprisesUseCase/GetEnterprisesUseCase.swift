//
//  GetCompaniesUseCase.swift
//  Domain
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public class GetEnterprisesUseCase {

    private let repository: GetEnterprisesRepositoryProtocol

    public init(repository: GetEnterprisesRepositoryProtocol) {
        self.repository = repository
    }
}

extension GetEnterprisesUseCase: GetEnterprisesUseCaseProtocol {
    
    public func execute(completion: @escaping (Result<SearchResponse, Error>) -> ()) {
        repository.getEnterprises(completion: completion)
    }
}
