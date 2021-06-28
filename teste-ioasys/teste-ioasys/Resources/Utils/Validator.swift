//
//  Validator.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 28/06/21.
//

import Foundation
import UIKit

struct Validator {
    
    func checkIfEmailIsValid(_ email: String) -> Bool {

        let emailRegEx = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        if email.count == 0 {
            return (false)
        } else if !emailTest.evaluate(with: email) {
            return (false)
        }

        return true

    }
    
    func checkIfEmptyFields(viewWhereFields: UIView) -> Bool{
        for view in viewWhereFields.subviews {
            if view .isKind(of: CustomTextField.self) {
                let textField = view as! CustomTextField
                textField.cleanToEdit()
                guard let text = textField.text, !text.isEmpty else {
                    textField.setErrorState(message: "Campo obrigatório")
                    return false
                }
            }
        }
        return true
    }
}
