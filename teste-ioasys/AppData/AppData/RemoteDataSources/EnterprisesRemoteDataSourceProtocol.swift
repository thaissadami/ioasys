//
//  EnterprisesRemoteDataSourceProtocol.swift
//  AppData
//
//  Created by Thais Sadami on 11/08/21.
//

import Domain

public protocol EnterprisesRemoteDataSourceProtocol: Any {

    func getEnterprises(request: EnterprisesRequestDTO, completion: @escaping DataCompletion<[EnterprisesResponseDTO]>)
}
