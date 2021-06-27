//
//  Utils.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation
import UIKit

class Utils {
    
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
    
    public class var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
    }
}
