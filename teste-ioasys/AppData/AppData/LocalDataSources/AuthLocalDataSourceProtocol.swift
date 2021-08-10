//
//  AuthLocalDataSourceProtocol.swift
//  AppData
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain

public protocol AuthLocalDataSourceProtocol: AnyObject {

    func save(_ investor: Investor, completion: @escaping (Result<Void, Error>) -> ())
}
