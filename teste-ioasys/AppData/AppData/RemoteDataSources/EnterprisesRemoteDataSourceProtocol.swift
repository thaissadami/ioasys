//
//  EnterprisesRemoteDataSourceProtocol.swift
//  AppData
//
//  Created by Thais Sadami on 11/08/21.
//

import Domain

public protocol EnterprisesRemoteDataSourceProtocol: Any {

    func getEnterprises(header: HeaderEnterprisesRequestDTO, request: EnterprisesRequestDTO, completion: @escaping DataCompletion<[EnterprisesResponseDTO]>)
}
