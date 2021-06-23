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
//    let headers: HTTPHeaders = [
//        .authorization(bearerToken: ""),
//        .accept("application/json"),
//        .init(name: "BundleId", value: Constants.BundleId)
//    ]
    
    let headers: HTTPHeaders = [
        .authorization(bearerToken: ""),
        .accept("application/json")
    ]
    
    public func makeRequest(method: HTTPMethod, url:String, parameters: Parameters?){

        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { response in
            
            if let status = response.response?.statusCode {
                if (status == 200){
                    self.successResult(response: response)
//                    if case let .success(data) = response.result {
//
//                    }
                    
                }else{
                    if case let .failure(error) = response.result {
                        self.failure(error:error)
                    }
                }
            }
        }
    }
    
    public func successResult(response:AFDataResponse<Data>){
        
    }
    
    public func failure(error:AFError){
        
    }
}
    
