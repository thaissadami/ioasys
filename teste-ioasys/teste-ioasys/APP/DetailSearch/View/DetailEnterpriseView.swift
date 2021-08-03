//
//  DetailEnterpriseView.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation
import SnapKit
import UIKit

class DetailEnterpriseView: UIView, CodeView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    func buildViewHierarchy(){
        self.addSubview(tableView)
        self.addSubview(header)
        self.addSubview(buttonBack)
        self.addSubview(lbName)
    }
    
    func setupConstraints(){
        
        header.snp.makeConstraints { (make) in
            make.height.equalTo(72)
            
            if #available(iOS 11, *) {
                make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            } else {
                make.top.equalTo(self)
            }
            
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        buttonBack.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalTo(header.snp.top).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    
        lbName.snp.makeConstraints { make in
            make.height.equalTo(72)
            make.top.equalTo(header.snp.top)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    let header: UIView = {
        let view = UIView()
        return view
    }()
    
    let buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        return button
    }()
    
    let lbName: UILabel = {
        let label = UILabel()
        label.font = Utils.fontMedium(size: 20)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorColor = .clear
        table.showsVerticalScrollIndicator = false
        return table
    }()
}



