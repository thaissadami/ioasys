//
//  UIAlertController+Extension.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 09/08/21.
//

import UIKit

extension UIAlertController {

    static public func attentionAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }

    static public func successAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Sucesso", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}

