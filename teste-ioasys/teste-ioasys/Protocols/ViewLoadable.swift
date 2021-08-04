//
//  ViewLoadable.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import Foundation

protocol ViewLoadable: AnyObject {
    func showLoading()
    func hideLoading()
}
