//
//  CodeView.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}
