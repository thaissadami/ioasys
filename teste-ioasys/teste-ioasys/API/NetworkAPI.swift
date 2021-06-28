//
//  NetworkAPI.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON

public class NetworkAPI {

    var headers: HTTPHeaders = [.contentType("application/json")]
    let baseURL: String = APIEnvironment.production.baseURLAPI()
    
    func setHeaders(){
        guard let accessToken = StateManager.sharedManager.accessToken else {
            return
        }
        guard let client = StateManager.sharedManager.client else {
            return
        }
        guard let uid = StateManager.sharedManager.uid else {
            return
        }
        
        self.headers.add(name: "access-token", value: accessToken)
        self.headers.add(name: "client", value: client)
        self.headers.add(name: "uid", value: uid)
    }
    
    public func makeRequest(method: HTTPMethod, url:String, parameters: Parameters?){
        let fullURL = baseURL.appending(url)
        self.setHeaders()
        
        AF.request(fullURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { response in

            if let status = response.response?.statusCode {
                if (status >= 200 && status <= 300){
                    self.successResult(response: response)
                }else{
                    self.failure(error:response)
                }
            }
        }
    }
    
    public func successResult(response:AFDataResponse<Data>){
        
    }
    
    public func failure(error:AFDataResponse<Data>){
        
    }
}
    
