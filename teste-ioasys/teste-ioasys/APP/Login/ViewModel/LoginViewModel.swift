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
        
        if (validateFields()){
            makeRequest(method: .post, url: Constants.URL.login, parameters: credential.toJSONDictionary())
        }
    }
    
    override func successResult(response:AFDataResponse<Data>) {
//        do {
//            let user = try JSONDecoder().decode(LoginResponse.self, from: response.data ?? Data())
            
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
//        } catch {
//            print(error.localizedDescription)
//        }
        
        self.viewController.stopLoading()
    }
    
    override func failure(error:AFDataResponse<Data>){
        
        do {
            //SHOW MESSAGE FROM SERVER
//            let errorResult = try JSONDecoder().decode(ErrorResult.self, from: error.data ?? Data())
//            self.viewController.setFailure(errorMessage: errorResult.errors![0])
            
            //TO BETTER EXPERIENCE TO USER AND ACCORDING LAYOUT
            let status = error.response?.statusCode
            if status == 401 {
                self.viewController.setFailure(errorMessage: "Credenciais incorretas")
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        self.viewController.stopLoading()
    }
    
    func validateFields() -> Bool{
        
        if !Validator().checkIfEmptyFields(viewWhereFields: self.viewController.mainView.containerView){
            self.viewController.stopLoading()
            return false
        }
        
        if !Validator().checkIfEmailIsValid(self.viewController.mainView.tfEmail.text ?? "") {
            self.viewController.mainView.tfEmail.setErrorState(message: "Email inválido")
            self.viewController.stopLoading()
            return false
        }
        
        return true
    }
}
