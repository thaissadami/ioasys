//
//  EnterprisesRepositoryProtocol.swift
//  Domain
//
//  Created by Thais Sadami on 10/08/21.
//

import Foundation

public protocol EnterprisesRepositoryProtocol: AnyObject {

    func getEnterprisesWithName(request: EnterprisesRequest, completion: @escaping (ResultCompletion<SearchResponse>))
}

