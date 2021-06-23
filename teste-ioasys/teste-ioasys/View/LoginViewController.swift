//
//  LoginViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import UIKit
import Material

//WITH XIB
//class LoginViewController: UIViewController {
//    @IBOutlet weak var tfEmail: CustomTextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        tfEmail.setErrorState(message: "erro")
//        return true
//    }
//}

class LoginViewController: UIViewController {
    
    var credentialModel: Credential?
    var mainView: LoginView { return self.view as! LoginView}
    let lastFieldTag = 1
    public var loginViewModel: LoginViewModel = LoginViewModel()

    override func loadView() {
        let mainView = LoginView(frame: UIScreen.main.bounds)
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureKeyboard()
        
        mainView.buttonSignIn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    func configureKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    func configureTextField() {
        for view in mainView.containerView.subviews {
            if view .isKind(of: UITextField.self) {
                let textField = view as! UITextField
                textField.delegate = self
            }
        }
    }
    
    func validateFields(){
        for view in mainView.containerView.subviews {
            if view .isKind(of: CustomTextField.self) {
                let textField = view as! CustomTextField
                textField.cleanToEdit()
                guard let text = textField.text, !text.isEmpty else {
                    textField.setErrorState(message: "Campo obrigatório")
                    return
                }
            }
        }
        
        if !isValidEmail(mainView.tfEmail.text!) {
            mainView.tfEmail.setErrorState(message: "Email inválidao")
            return
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func signIn(){
        validateFields()
        credentialModel = Credential(email: "testeapple@ioasys.com.br", password: "12341234")
        
        //HARDCODE TO TEST
//        credentialModel = Credential(email: mainView.tfEmail.text!, password: mainView.tfPassword.text!)
        loginViewModel.signIn(credential: credentialModel!)
    }
    
    // MARK: Keyboard Notifications
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        mainView.setOpenKeyboard(heightKeyboard: keyboardFrame.size.height)
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        mainView.setCloseKeyboard()
        self.view.layoutIfNeeded()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

}
