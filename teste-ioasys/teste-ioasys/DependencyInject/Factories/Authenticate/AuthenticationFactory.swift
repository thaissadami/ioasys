//
//  AuthenticationFactory.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 04/08/21.
//

import UIKit

protocol AuthenticationFactory: DependencyFactory {

   func makeLoginViewController() -> LoginViewController
}
