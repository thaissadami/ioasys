//
//  AuthLocalDataSourceProtocol.swift
//  AppData
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Domain

public protocol AuthLocalDataSourceProtocol: AnyObject {

//    func save(investor: Investor) throws
    func saveToken(_ token: String) throws
    func saveUid(_ uid: String) throws
    func saveClient(_ client: String) throws
}
