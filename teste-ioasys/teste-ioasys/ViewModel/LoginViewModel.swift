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
    
    let loginViewController: LoginViewController
    
    init(loginViewController: LoginViewController) {
            self.loginViewController = loginViewController
        }
    
    func signIn(credential: Credential){

        makeRequest(method: .post, url: "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in", parameters: credential.toJSONDictionary())
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        
        self.loginViewController.loadingCustom.dismiss()
        
        let jsonData = try! JSON(data:response.data ?? Data())

        do {
            let user = try JSONDecoder().decode(LoginResponse.self, from: response.data ?? Data())
            
            if let headers = response.response?.allHeaderFields as? [String: String]{
                let accessToken = headers["access-token"]
                let client = headers["client"]
                let uid = headers["uid"]
                let uiad = headers["uid"]
            }
            
            print(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
