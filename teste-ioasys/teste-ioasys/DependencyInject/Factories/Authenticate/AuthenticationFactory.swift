//
//  AuthenticationFactory.swift
//  teste-ioasys
//
//  Created by Itamar Silva on 06/08/20.
//  Copyright © 2020 Itamar Silva. All rights reserved.
//  Changes by Thais Sadami on 04/08/21.
//

import UIKit

protocol AuthenticationFactory: DependencyFactory {

   func makeLoginViewController() -> LoginViewController
}
