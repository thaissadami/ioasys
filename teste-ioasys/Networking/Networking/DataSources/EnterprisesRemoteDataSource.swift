//
//  EnterprisesRemoteDataSource.swift
//  Networking
//
//  Created by Thais Sadami on 11/08/21.
//

import AppData
import OxeNetworking
import Moya
import Domain
public class EnterprisesRemoteDataSource {

    private let dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
    
    private func handle(response: Response, completion: DataCompletion<[EnterprisesResponseDTO]>) {
        
        let encodedResponse = response.response(encoding: .isoLatin1)
    
        guard let mappedResponse = try? encodedResponse.map([EnterprisesResponseDTO].self, atKeyPath: "enterprises")
        else {
            return
        }
            completion(.success(mappedResponse))
        
    }
}

extension EnterprisesRemoteDataSource: AppData.EnterprisesRemoteDataSourceProtocol {
    
    public func getEnterprises(header: HeaderEnterprisesRequestDTO, request: EnterprisesRequestDTO, completion: @escaping DataCompletion<[EnterprisesResponseDTO]>) {
        dispatcher.call(endpoint: EnterprisesTarget.enterprisesList(header, request)) { [weak self] result in
            result.successHandler { response in
                self?.handle(response: response, completion: completion)
            }
            result.failureHandler { error in
                completion(.failure(error))
            }
        }
    }
}
