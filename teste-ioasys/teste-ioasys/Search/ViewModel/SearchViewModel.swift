//
//  SearchViewModel.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Alamofire
import SwiftyJSON

class SearchViewModel: NetworkAPI{
    
    let viewController: SearchViewController
    
    init(viewController: SearchViewController) {
        self.viewController = viewController
    }
    
    func getEnterprisesWithName(text: String){
        var url = "/api/v1/enterprises?name="
        url.append(text)
        self.viewController.loadingCustom.show()
    
        let accessToken = Header(key: "access-token", value: StateManager.sharedManager.accessToken ?? "")
        let client = Header(key: "client", value: StateManager.sharedManager.client ?? "")
        let uid = Header(key: "uid", value: StateManager.sharedManager.uid ?? "")
        setHeaders(headers: [accessToken, client, uid])
        makeRequest(method: .get, url:url, parameters:nil)
    }
    
    func search(text: String){
        
        self.viewController.loadingCustom.show()
    
        makeRequest(method: .post, url: "https://empresas.ioasys.com.br/api/v1/enterprises?name=a", parameters:nil)
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        
        self.viewController.loadingCustom.dismiss()
        let jsonData = try! JSON(data:response.data ?? Data())

        do {
            let response = try JSONDecoder().decode(SearchResponse.self, from: response.data ?? Data())
            self.viewController.result = response.enterprises!
            
            print(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func failure(error:AFError){
        self.viewController.loadingCustom.dismiss()
    }
}

