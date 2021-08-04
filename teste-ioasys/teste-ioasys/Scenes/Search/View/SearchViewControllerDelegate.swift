//
//  SearchViewControllerDelegate.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation
import UIKit
import Material

extension SearchViewController: TextFieldDelegate, TableViewDelegate, TableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reusableIdentifier, for: indexPath)
        
        if let cell = cell as? SearchCell {
            let enterprise = result[indexPath.row]
            cell.setup(with:enterprise.photo ?? "", name: enterprise.enterpriseName ?? "")
        }

        return cell
    }
    
    

    // MARK: DataSource

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    // MARK: Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let enterprise = result[indexPath.row]
        openDetailEnterprise(enterprise: enterprise)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count == 0 {
            mainView.setInitialConstraints()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchEnterprise()
        return true
    }
    
}
