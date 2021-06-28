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
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reusableIdentifier, for: indexPath)
            
            if let cell = cell as? ImageCell {
                cell.setup(with: enterprise?.photo ?? "")
            }
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reusableIdentifier, for: indexPath)
            
            if let cell = cell as? DescriptionCell {
                cell.setup(description: enterprise?.description ?? "")
            }
            return cell
        }
    }

    // MARK: DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK: Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        }else{
            return UITableView.automaticDimension
        }
    }
    
}

