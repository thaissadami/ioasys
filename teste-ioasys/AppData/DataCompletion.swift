//
//  DataCompletion.swift
//  AppData
//
//  Created by Jezreel Barbosa on 30/12/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Foundation

public typealias DataCompletion<T> = (_ result: Swift.Result<T, Error>) -> Void

public protocol DataError: Equatable, Error {

    static var numberPrefix: String { get }
}
