//
//  LoginViewControllerDelegate.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation
import UIKit
import Material

extension LoginViewController: TextFieldDelegate {

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let tf = textField as! CustomTextField
        tf.cleanToEdit()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tf = textField as! CustomTextField
        
        if tf.tag == lastFieldTag {
            tf.resignFirstResponder()
        }else{
            tf.cleanToEdit()
            signIn()
        }
        return true
    }
    
}
