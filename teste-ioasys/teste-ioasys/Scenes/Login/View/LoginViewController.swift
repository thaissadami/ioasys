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

    let lastFieldTag = 1
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
        presenter.logIn(email: email, password: password)
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

extension LoginViewController: LoginViewable, IndicatorProtocol {

    func showLoading() {
        showActivityIndicator(in: self.loadingCustom)
    }

    func hideLoading() {
        hideActivityIndicator(in: self.loadingCustom)
    }

    func showAlert(message: String) {
//        presentAttentionAlert(message: message)
        setFailure(errorMessage: message)
    }
}
