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
        var url = Constants.URL.searchEnterprise
        url.append(text)
        makeRequest(method: .get, url:url, parameters:nil)
    }
    
    override func successResult(response:AFDataResponse<Data>) {
        
        do {
            let response = try JSONDecoder().decode(SearchResponse.self, from: response.data ?? Data())
            self.viewController.result = response.enterprises!
        } catch {
            print(error.localizedDescription)
        }
        self.viewController.stopLoading()
    }
    
    override func failure(error:AFDataResponse<Data>){
        
        do {
            let errorResult = try JSONDecoder().decode(ErrorResult.self, from: error.data ?? Data())
            Utils().alertMessage(viewController: self.viewController, title: errorResult.errors![0], message: "")
        } catch {
            print(error.localizedDescription)
        }
        
        self.viewController.stopLoading()
    }
}

