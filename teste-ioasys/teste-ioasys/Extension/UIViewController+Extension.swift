//
//  UIViewController+Extension.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 09/08/21.
//

import UIKit
import Domain

extension UIViewController {

    func presentAttentionAlert(message: String) {
        let alert = UIAlertController.attentionAlert(message: message)
        present(alert, animated: true, completion: nil)
    }

    func presentSuccessAlert(message: String) {
        let alert = UIAlertController.successAlert(message: message)
        present(alert, animated: true, completion: nil)
    }
}

