//
//  LoginViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import UIKit
import Material

class LoginViewController: UIViewController {
    
    var mainView: LoginView { return self.view as! LoginView}
    var credentialModel: Credential?
    let lastFieldTag = 1
    public var loginViewModel: LoginViewModel?
    public var loadingCustom: ActivityIndicatorCustom! = nil

    override func loadView() {
        let mainView = LoginView(frame: UIScreen.main.bounds)
        self.view = mainView
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureKeyboard()
        loginViewModel = LoginViewModel(viewController: self)
        loadingCustom = ActivityIndicatorCustom(viewController: self)
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
    
    @objc func signIn(){
        
        //HARDCODE TO TEST
        credentialModel = Credential(email: "testeapple@ioasys.com.br", password: "12341234")
        
        
//        credentialModel = Credential(email: mainView.tfEmail.text!, password: mainView.tfPassword.text!)
        loginViewModel?.signIn(credential: credentialModel!)
    }
    
    func goToSearch(){
        let searchViewController = SearchViewController()
        self.navigationController?.pushViewController(searchViewController, animated: true)
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
