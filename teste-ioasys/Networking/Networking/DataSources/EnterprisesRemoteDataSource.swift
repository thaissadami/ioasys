//
//  EnterprisesRemoteDataSource.swift
//  Networking
//
//  Created by Thais Sadami on 11/08/21.
//

import AppData
import OxeNetworking
import Moya

public class EnterprisesRemoteDataSource {

    private let dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
    
    private func handle(response: Response, completion: DataCompletion<[EnterprisesResponseDTO]>) {
        
        let encodedResponse = response.response(encoding: .isoLatin1)
        
        if encodedResponse.hasReturnCodeSuccess(),
           let mappedResponse = try? encodedResponse.map([EnterprisesResponseDTO].self, atKeyPath: "enterprises") {
            completion(.success(mappedResponse))
        }
    }
}

extension EnterprisesRemoteDataSource: AppData.EnterprisesRemoteDataSourceProtocol {
    
    public func getEnterprises(request: EnterprisesRequestDTO, completion: @escaping DataCompletion<[EnterprisesResponseDTO]>) {
        dispatcher.call(endpoint: EnterprisesTarget.enterprisesList(request)) { [weak self] result in
            result.successHandler { response in
                self?.handle(response: response, completion: completion)
            }
            result.failureHandler { error in
                completion(.failure(error))
            }
        }
    }
}
