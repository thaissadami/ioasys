//
//  UIView+Extension.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 11/08/21.
//

import UIKit

extension UIView {
    func setTapToEndEditing() {
        let tapToHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(endEditingForced))
        addGestureRecognizer(tapToHideKeyboard)
    }

    @objc private func endEditingForced() {
        endEditing(true)
    }
}
