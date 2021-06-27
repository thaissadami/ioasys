//
//  SearchView.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation
import SnapKit

class SearchView: UIView, CodeView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    func buildViewHierarchy(){
        containerView.addSubview(imgBgTop)
        containerView.addSubview(imgMaskBgTop)
        containerView.addSubview(viewSearch)
        viewSearch.addSubview(tfSearch)
        
        self.addSubview(containerView)
        self.addSubview(lbResult)
        self.addSubview(lbEmpty)
        self.addSubview(tableView)
        
    }
    
    func setupConstraints(){
        
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(212)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imgMaskBgTop.snp.makeConstraints { make in
            make.height.equalTo(188)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imgBgTop.snp.makeConstraints { make in
            make.height.equalTo(188)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        viewSearch.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(imgBgTop.snp.bottom).inset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        tfSearch.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(viewSearch.snp.top)
            make.leading.equalToSuperview().offset(48)
            make.trailing.equalToSuperview().inset(16)
        }
        
        lbResult.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.top.equalTo(containerView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.size.height - containerView.frame.size.height - lbResult.frame.size.height)
            make.top.equalTo(lbResult.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        lbEmpty.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.top.equalTo(containerView.snp.bottom).offset(140)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setOpenKeyboard(heightKeyboard: CGFloat){
        
        UIView.animate(withDuration: 5) {
            self.containerView.snp.updateConstraints { (make) in
                make.top.equalToSuperview().inset(-100)
            }
            self.imgMaskBgTop.isHidden = true
        }
    }
    
    func setCloseKeyboard(){
        UIView.animate(withDuration: 5) {
            self.containerView.snp.updateConstraints { (make) in
            make.top.equalToSuperview()
        }
            self.imgMaskBgTop.isHidden = false
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imgBgTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg_search")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()
    
    let imgMaskBgTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mask_search")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()
    
    let viewSearch: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor.grayLight
        
        let img = UIImageView(image: UIImage(named: "ic_search"))
        img.frame = CGRect(x: 16, y: 14, width: 20, height: 20)
        view.addSubview(img)
                    
        return view
    }()
    
    let tfSearch: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pesquise por empresa"
        textField.returnKeyType = UIReturnKeyType.search
        textField.font = Utils.fontLight(size: 18)
        textField.tintColor = UIColor(named: "primaryColor")
        textField.autocorrectionType = .no
        return textField
    }()
    
    let lbResult: UILabel = {
        let label = UILabel()
        label.font = Utils.fontLight(size: 14)
        label.textColor = UIColor.grayDark
        label.text = "04 resultados encontrados"
        label.isHidden = true
        return label
    }()
    
    let lbEmpty: UILabel = {
        let label = UILabel()
        label.font = Utils.fontLight(size: 18)
        label.textColor = UIColor.grayDark
        label.textAlignment = .center
        label.text = "Nenhum resultado encontrado"
        label.isHidden = true
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorColor = .clear
        table.showsVerticalScrollIndicator = false
        return table
    }()
}

