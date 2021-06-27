//
//  DetailEnterpriseViewModel.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 27/06/21.
//

import Alamofire
import SwiftyJSON

class DetailEnterpriseViewModel: NetworkAPI{
    
    let viewController: DetailEnterpriseViewController
    
    init(viewController: DetailEnterpriseViewController) {
        self.viewController = viewController
    }
    
    func getEnterprisesWithId(id: Int){
        var url = "https://empresas.ioasys.com.br/api/v1/enterprises/"
        url.append(String(id))
        self.viewController.loadingCustom.show()
    
        let accessToken = Header(key: "access-token", value: StateManager.sharedManager.accessToken ?? "")
        let client = Header(key: "client", value: StateManager.sharedManager.client ?? "")
        let uid = Header(key: "uid", value: StateManager.sharedManager.uid ?? "")
        setHeaders(headers: [accessToken, client, uid])
        makeRequest(method: .get, url:url, parameters:nil)
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        
        self.viewController.loadingCustom.dismiss()
        let jsonData = try! JSON(data:response.data ?? Data())

        do {
//            let response = try JSONDecoder().decode(SearchResponse.self, from: response.data ?? Data())
//            self.viewController.result = response.enterprises!
            
            print(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func failure(error:AFError){
        self.viewController.loadingCustom.dismiss()
    }
}
