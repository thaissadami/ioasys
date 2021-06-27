//
//  LoginViewModel.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginViewModel: NetworkAPI{
    
    let viewController: LoginViewController
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func signIn(credential: Credential){
        
        self.viewController.loadingCustom.show()
        validateFields()
        
        makeRequest(method: .post, url: "/api/v1/users/auth/sign_in", parameters: credential.toJSONDictionary())
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        
        self.viewController.loadingCustom.dismiss()
        
        let jsonData = try! JSON(data:response.data ?? Data())

        do {
            let user = try JSONDecoder().decode(LoginResponse.self, from: response.data ?? Data())
            
            if let headers = response.response?.allHeaderFields as? [String: String]{
                let accessToken = headers["access-token"]
                let client = headers["client"]
                let uid = headers["uid"]
                
                StateManager.sharedManager.userLogged = true
                StateManager.sharedManager.accessToken = accessToken!
                StateManager.sharedManager.client = client!
                StateManager.sharedManager.uid = uid!
                
                self.viewController.goToSearch()
            }
            
            print(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func failure(error:AFError){
        self.viewController.loadingCustom.dismiss()
    }
    
    func validateFields(){
        for view in self.viewController.mainView.containerView.subviews {
            if view .isKind(of: CustomTextField.self) {
                let textField = view as! CustomTextField
                textField.cleanToEdit()
                guard let text = textField.text, !text.isEmpty else {
                    textField.setErrorState(message: "Campo obrigatório")
                    self.viewController.loadingCustom.dismiss()
                    return
                }
            }
        }
        
        if !isValidEmail(self.viewController.mainView.tfEmail.text!) {
            self.viewController.mainView.tfEmail.setErrorState(message: "Email inválido")
            self.viewController.loadingCustom.dismiss()
            return
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
