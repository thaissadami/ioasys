//
//  ViewLoadable.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//

import Foundation

protocol ViewLoadable: AnyObject {
    func showLoading()
    func hideLoading()
}
