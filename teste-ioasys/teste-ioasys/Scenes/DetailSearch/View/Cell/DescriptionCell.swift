//
//  DescriptionCell.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 27/06/21.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class DescriptionCell: UITableViewCell, CodeView {
    
    static let reusableIdentifier = "DescriptionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DescriptionCell.reusableIdentifier)
        self.selectionStyle = .none
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(description: String) {
        lbDescription.text = description
    }
    
    func buildViewHierarchy() {
        self.addSubview(lbDescription)
    }
    
    func setupConstraints() {
        lbDescription.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    let lbDescription: UILabel = {
        let label = UILabel()
        label.font = Utils.fontLight(size: 18)
        label.numberOfLines = 0
        label.textColor = .black
        label.clipsToBounds = true
        return label
    }()

}

