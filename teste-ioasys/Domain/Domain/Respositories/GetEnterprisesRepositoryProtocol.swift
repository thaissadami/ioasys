//
//  GetCompaniesRepositoryProtocol.swift
//  Domain
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public protocol GetEnterprisesRepositoryProtocol: AnyObject {

    func getEnterprises(completion: @escaping (Result<SearchResponse, Error>) -> ())
}

