//
//  IndicatorProtocol.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 09/08/21.
//

import Foundation

// View
protocol IndicatorViewable {

    var activityIndicatorView: ActivityIndicatorCustom { get set }
}

// ViewController
protocol IndicatorProtocol: AnyObject {}

extension IndicatorProtocol {

    func showActivityIndicator(in indicatorView: ActivityIndicatorCustom) {
        indicatorView.show()
    }

    func hideActivityIndicator(in indicatorView: ActivityIndicatorCustom) {
        indicatorView.dismiss()
    }
}

