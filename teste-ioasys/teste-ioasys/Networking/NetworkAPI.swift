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
    
    var headers: HTTPHeaders = [.contentType("application/json")]
    let baseURL:String = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
    
    public func setHeaders(headers: [Header]){
        for header in headers {
            self.headers.add(name: header.key, value: header.value)
        }
    }
    
    public func makeRequest(method: HTTPMethod, url:String, parameters: Parameters?){


        let fullURL = baseURL.appending(url)
        
        AF.request(fullURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { response in
            
            if let status = response.response?.statusCode {
                if (status == 200){
                    self.successResult(response: response)
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
    
