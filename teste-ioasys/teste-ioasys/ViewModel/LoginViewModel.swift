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
    
//    private var email = ""
//    private var password = ""
//
//    private var user = User() {
//            didSet {
//                email = user.email
//                password = user.password
//            }
//        }
    
    func signIn(credential: Credential){

        makeRequest(method: .post, url: "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in", parameters: credential.toJSONDictionary())
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        let jsonData = try! JSON(data:response.data ?? Data())

        do {
            let user = try JSONDecoder().decode(LoginResponse.self, from: response.data ?? Data())
            
            if let headers = response.response?.allHeaderFields as? [String: String]{
                let accessToken = headers["access-token"]
                let client = headers["client"]
                let uid = headers["uid"]
                
            }
            
            print(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
    
    
//    func validateDataUser() -> LoginAuthenticateStatus {
//            if email.isEmpty && password.isEmpty {
////                credentialsInputErrorMessage.value = "Please provide username and password."
//                return .Incorrect
//            }
//            if email.isEmpty {
////                credentialsInputErrorMessage.value = "Username field is empty."
////                isUsernameTextFieldHighLighted.value = true
//                return .Incorrect
//            }
//            if email.isEmpty {
////                credentialsInputErrorMessage.value = "Password field is empty."
////                isPasswordTextFieldHighLighted.value = true
//                return .Incorrect
//            }
//            return .Correct
//        }
//}
//
//extension LoginViewModel {
//    enum LoginAuthenticateStatus {
//        case Correct
//        case Incorrect
//    }
//}
