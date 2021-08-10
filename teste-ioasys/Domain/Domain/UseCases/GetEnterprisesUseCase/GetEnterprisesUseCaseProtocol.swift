//
//  GetCompaniesUseCaseProtocol.swift
//  Domain
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public protocol GetEnterprisesUseCaseProtocol: AnyObject {

    func execute(completion: @escaping (Result<SearchResponse, Error>) -> ())
}

