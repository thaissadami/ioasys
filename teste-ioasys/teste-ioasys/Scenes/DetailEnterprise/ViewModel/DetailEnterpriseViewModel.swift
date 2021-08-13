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
    
    func getDetailEnterprise(id: Int){
        var url = Constants.URL.detailEnterprise
        url.append(String(id))
        makeRequest(method: .get, url:url, parameters:nil)
    }
    
    override func successResult(response:AFDataResponse<Data>) {
//        do {
//            let response = try JSONDecoder().decode(EnterpriseResponse.self, from: response.data ?? Data())
//            self.viewController.enterprise = response.enterprise
//        } catch {
//            print(error.localizedDescription)
//        }
        
//        viewController.stopLoading()
    }
    
    override func failure(error:AFDataResponse<Data>){
        
        do {
            let errorResult = try JSONDecoder().decode(ErrorResult.self, from: error.data ?? Data())
            Utils().alertMessage(viewController: self.viewController, title: errorResult.errors![0], message: "")
        } catch {
            print(error.localizedDescription)
        }
        
//        self.viewController.stopLoading()
    }
}
