//
//  EnterprisesRepository.swift
//  AppData
//
//  Created by Thais Sadami on 11/08/21.
//

import Domain

public class EnterprisesRepository {

    private let localDataSource: AuthLocalDataSourceProtocol
    private let remoteDataSource: EnterprisesRemoteDataSourceProtocol

    public init(remoteDataSource: EnterprisesRemoteDataSourceProtocol, localDataSource: AuthLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
}

extension EnterprisesRepository: Domain.EnterprisesRepositoryProtocol {

    public func getEnterprisesWithName(request: EnterprisesRequest, completion: @escaping (ResultCompletion<SearchResponse>)) {
        
        do {
            let header = try localDataSource.getHeader()
            let requestDTO = EnterprisesRequestDTO(name: request.name)
            let headerDTO = HeaderEnterprisesRequestDTO(token: header.token, uid: header.uid, client: header.client)
            
            remoteDataSource.getEnterprises(header:headerDTO, request: requestDTO) { result in
                completion(result.map({ newSuccess in
                    SearchResponse(enterprises: newSuccess.map({ $0.toDomain }))
                }))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}

