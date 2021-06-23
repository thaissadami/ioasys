//
//  CustomTextField.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation
import Material

class CustomTextField: TextField {
    
    let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    var iconError: IconButton = IconButton(image: UIImage(named:"ic_error"))
    
    convenience init() {
        self.init(frame: .zero)
        setTheme()
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setTheme()
//    }
    
    func setTheme(){
        self.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        placeholderNormalColor = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)
        placeholderActiveColor = UIColor(named: "primaryColor")!
        dividerActiveHeight = 0
        dividerNormalHeight = 0
        leftViewOffset = 15
        isPlaceholderAnimated = false
        self.layer.cornerRadius = 5.0
        var frame = self.frame
        frame.size.height = 48
        self.frame = frame
        self.detailVerticalOffset = 4
        self.borderColor = UIColor(red: 224/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        self.detailLabel.textAlignment = NSTextAlignment(rawValue: 2)!
        self.detailColor = UIColor(red: 224/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        self.font = UIFont(name: "Rubik Light", size: 16)

        placeholderLabel.font = UIFont(name: "Rubik Regular", size: 14)
    }
    
    public func setErrorState(message: String){
        self.resignFirstResponder()
        self.rightViewMode = .unlessEditing
        
        rightView?.grid.views.insert(iconError, at: 0)
        self.detail = message
        self.layer.borderWidth = 1
    }
    
    public func cleanToEdit(){
        if let i = rightView?.grid.views.firstIndex(of: iconError) {
            rightView?.grid.views.remove(at: i)
            self.layer.borderWidth = 0
            self.detail = ""
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

