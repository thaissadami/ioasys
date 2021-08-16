//
//  EnterprisesLocalDataSourceProtocol.swift
//  AppData
//
//  Created by Thais Sadami on 13/08/21.
//

import Domain

public protocol EnterprisesLocalDataSourceProtocol: AnyObject {
    func save(response: [EnterprisesResponseDTO]) throws
    
    func getEnterprisesRequest() throws -> EnterprisesRequestDTO
    func getEnterprisesResponse() throws -> EnterprisesResponseDTO
}
