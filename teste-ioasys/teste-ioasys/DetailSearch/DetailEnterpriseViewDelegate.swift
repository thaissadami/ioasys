//
//  DetailEnterpriseViewDelegate.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 27/06/21.
//

import Foundation
import UIKit
import Material

extension DetailEnterpriseViewController: TableViewDelegate, TableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reusableIdentifier, for: indexPath)
        
        if let cell = cell as? SearchCell {
            cell.setup(with: "https://empresas.ioasys.com.br/uploads/enterprise/photo/9/240.jpeg", name: "teste")
        }

        return cell
    }

    // MARK: DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK: Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

