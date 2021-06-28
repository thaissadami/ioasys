//
//  Utils.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation
import UIKit

public class Utils {
    
    static func font(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik Regular", size: size)!
    }
    
    static func fontLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik Light", size: size)!
    }

    static func fontMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik Medium", size: size)!
    }

    static func fontBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik Bold", size: size)!
    }
    
    public func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    public func alertMessage(viewController: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
