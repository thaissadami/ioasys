//
//  LoginViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import UIKit
import Material

protocol LoginViewPresenting: AnyObject {
    func logIn(email: String, password: String)
}

class LoginViewController: UIViewController {
    
    var mainView: LoginView { return self.view as! LoginView}
    private let presenter: LoginViewPresenting
    

    var credentialModel: Credential?
    let lastFieldTag = 1
    public var loginViewModel: LoginViewModel?
    var loadingCustom: ActivityIndicatorCustom! = nil
    
    init(presenter: LoginViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        let mainView = LoginView(frame: UIScreen.main.bounds)
        self.view = mainView
        mainView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureKeyboard()
        loginViewModel = LoginViewModel(viewController: self)
        loadingCustom = ActivityIndicatorCustom(viewController: self)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
    
//    func goToSearch(){
//        let searchViewController = SearchViewController()
//        self.navigationController?.pushViewController(searchViewController, animated: true)
//    }
    
    func setFailure(errorMessage: String){
        for view in mainView.containerView.subviews {
            if view .isKind(of: CustomTextField.self) {
                let textField = view as! CustomTextField
                textField.setErrorState(message: "")
                if textField.tag == lastFieldTag {
                    textField.setErrorState(message: errorMessage)
                }
            }
        }
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

// MARK: LoginViewDelegate

extension LoginViewController: LoginViewDelegate {

    func didTapLogin(_ email: String, password: String) {
        
        showLoading()

        presenter.logIn(email: email, password: password)
        
        //OLD
//        credentialModel = Credential(email: mainView.tfEmail.text!, password: mainView.tfPassword.text!)
//        loginViewModel?.signIn(credential: credentialModel!)
    }
}

// MARK: TextFieldDelegate

extension LoginViewController: TextFieldDelegate {

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let tf = textField as! CustomTextField
        tf.cleanToEdit()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tf = textField as! CustomTextField
        
        if tf.tag == lastFieldTag {
            tf.resignFirstResponder()
        }else{
            tf.cleanToEdit()
            mainView.didTapLogin()
        }
        return true
    }
    
}

// MARK: LoginViewable

extension LoginViewController: LoginViewable {

    func showLoading() {
        self.loadingCustom.show()
    }

    func hideLoading() {
        self.loadingCustom.dismiss()
    }

    func showAlert(message: String) {
    }
    
    func showEmailError(_ message: String) {
        debugPrint(#function)
    }

    func showPasswordError(_ message: String) {
        debugPrint(#function)
    }

}
