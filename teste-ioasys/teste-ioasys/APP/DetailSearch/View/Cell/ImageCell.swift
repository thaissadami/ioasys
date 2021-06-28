//
//  ImageCell.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 27/06/21.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class ImageCell: UITableViewCell, CodeView {
    
    static let reusableIdentifier = "ImageCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ImageCell.reusableIdentifier)
        self.selectionStyle = .none
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with urlImage: String) {
        let url = "\(APIEnvironment.production.baseURL())\(urlImage)"
        
        img.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions(rawValue: 0), context: nil)
    }
    
    func buildViewHierarchy() {
        self.addSubview(img)
    }
    
    func setupConstraints() {
        img.snp.makeConstraints { (make) in
            make.height.equalTo(120)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    let img: UIImageView = {
        let image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

}

