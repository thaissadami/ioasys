//
//  LoginView.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 21/06/21.
//

import Foundation
import SnapKit

class LoginView: UIView, CodeView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func buildViewHierarchy(){
        containerView.addSubview(imgBgTop)
        containerView.addSubview(imgLogo)
        containerView.addSubview(lbWelcome)
        containerView.addSubview(tfEmail)
        containerView.addSubview(tfPassword)
        containerView.addSubview(buttonSignIn)
        
        self.addSubview(containerView)
    }
    
    func setupConstraints(){
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imgBgTop.snp.makeConstraints { make in
            make.height.equalTo(234)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imgLogo.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.top.equalToSuperview().inset(84)
            make.centerX.equalToSuperview()
        }
        
        lbWelcome.snp.makeConstraints { make in
            make.top.equalTo(imgLogo.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        tfEmail.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(imgBgTop.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        tfPassword.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(tfEmail.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        buttonSignIn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(tfPassword.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setOpenKeyboard(heightKeyboard: CGFloat){
        
        UIView.animate(withDuration: 5) {
            self.containerView.snp.updateConstraints { (make) in
                make.top.equalToSuperview().inset(-100)
                
            }
            self.imgLogo.snp.updateConstraints { (make) in
                make.top.equalToSuperview().inset(180)
                
            }
            self.lbWelcome.isHidden = true
        
            self.layoutIfNeeded()
        }
    }
    
    func setCloseKeyboard(){
        containerView.snp.updateConstraints { (make) in
            make.top.equalToSuperview()
        }
        self.imgLogo.snp.updateConstraints { (make) in
            make.top.equalToSuperview().inset(84)
            
        }
        self.lbWelcome.isHidden = false
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imgBgTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mask_initial_flow")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()
    
    let lbWelcome: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        label.text = "Seja bem vindo ao empresas!"
        return label
    }()
    
    let imgLogo: UIImageView = {
        let imgLogo = UIImageView()
        imgLogo.image = UIImage(named: "logo_icon")
        imgLogo.contentMode = UIView.ContentMode.center
        return imgLogo
    }()
    
    let tfEmail: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        return textField
    }()
    
    let tfPassword: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Senha"
        textField.isVisibilityIconButtonEnabled = true
        textField.isVisibilityIconButtonAutoHandled = true
        textField.tag = 1
        return textField
    }()
    
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "primaryColor")
        button.layer.cornerRadius = 8.0
        button.setTitle("ENTRAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik Medium", size: 16)
        button.isUserInteractionEnabled = true
        
        return button
    }()
}
