//
//  EnterprisesRepository.swift
//  AppData
//
//  Created by Thais Sadami on 11/08/21.
//

import Domain

public class EnterprisesRepository {

    private let remoteDataSource: EnterprisesRemoteDataSourceProtocol

    public init(remoteDataSource: EnterprisesRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

extension EnterprisesRepository: Domain.EnterprisesRepositoryProtocol {

    public func getEnterprisesWithName(request: EnterpriseRequest, completion: @escaping (ResultCompletion<SearchResponse>)) {
        
        do {
            let requestDTO = EnterprisesRequestDTO(name: request.name)
            remoteDataSource.getEnterprises(request: requestDTO) { result in
                completion(result.map({ newSuccess in
                    SearchResponse(enterprises: newSuccess.map({ $0.toDomain }))
                }))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}

