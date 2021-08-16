//
//  EnterprisesRepository.swift
//  AppData
//
//  Created by Thais Sadami on 11/08/21.
//

import Domain

public class EnterprisesRepository {

    private let localDataSource: EnterprisesLocalDataSourceProtocol
    private let remoteDataSource: EnterprisesRemoteDataSourceProtocol

    public init(remoteDataSource: EnterprisesRemoteDataSourceProtocol, localDataSource: EnterprisesLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
}

extension EnterprisesRepository: Domain.EnterprisesRepositoryProtocol {

    public func getEnterprisesWithName(request: EnterpriseRequest, completion: @escaping (ResultCompletion<SearchResponse>)) {
        
        do {
            let request = try localDataSource.getEnterprisesRequest()
//            remoteDataSource.getEnterprises(request: request) { result in
//                self.handle(result: result, completion: { result in
//                    result.successHandler { response in
////                        completion(.success(response.toDomain))
//                    }
//                    result.failureHandler { error in
//                        completion(.failure(error))
//                    }
//                })
//            }
            remoteDataSource.getEnterprises(request: request) { result in
                completion(result.map({ newSuccess in
                    SearchResponse(enterprises: newSuccess.map({ $0.toDomain }))
                }))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}

