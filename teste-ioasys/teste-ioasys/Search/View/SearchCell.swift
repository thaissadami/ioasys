//
//  SearchCell.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class SearchCell: UITableViewCell, CodeView {
    
    static let reusableIdentifier = "SearchCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: SearchCell.reusableIdentifier)
        self.selectionStyle = .none
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with urlImage: String, name: String) {
        
        var url = Utils.baseURL + urlImage
        
        img.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo"), options: SDWebImageOptions(rawValue: 0), context: nil)
        lbName.text = name.uppercased()
        self.isUserInteractionEnabled = true
    }
    
    func buildViewHierarchy() {
        self.addSubview(img)
        self.addSubview(lbName)
    }
    
    func setupConstraints() {
        img.snp.makeConstraints { (make) in
            make.height.equalTo(120)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        lbName.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    let img: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 4
        return image
    }()
    
    let lbName: UILabel = {
        let label = UILabel()
        label.font = Utils.fontBold(size: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

}
