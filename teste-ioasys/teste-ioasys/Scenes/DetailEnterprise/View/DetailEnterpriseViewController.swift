//
//  DetailEnterpriseViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import UIKit
import Material
import Domain

protocol DetailEnterpriseViewPresenting {
    func getDetailEnterprise(idEnterprise: Int)
}

class DetailEnterpriseViewController: UIViewController {
    
    var mainView: DetailEnterpriseView { return self.view as! DetailEnterpriseView}
    private let presenter: DetailEnterpriseViewPresenting
    
    open var dataSourceItems = [DataSourceItem]()
//    public var detailEnterpriseViewModel: DetailEnterpriseViewModel?
    public var loadingCustom: ActivityIndicatorCustom! = nil
//    public var enterprise: Enterprise?
    
    public var enterprise: Enterprise? = nil {
        didSet {
            self.mainView.tableView.reloadData()
        }
    }
    
    init(presenter: DetailEnterpriseViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        let mainView = DetailEnterpriseView(frame: UIScreen.main.bounds)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingCustom = ActivityIndicatorCustom(viewController: self)
        loadingCustom.bg.backgroundColor = .clear
    
//        detailEnterpriseViewModel = DetailEnterpriseViewModel(viewController: self)
//        if let enterpriseId = enterprise?.id {
//            showLoading()
//            detailEnterpriseViewModel?.getDetailEnterprise(id: enterpriseId)
//        }
        
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reusableIdentifier)
        self.mainView.tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.reusableIdentifier)
        
        self.mainView.lbName.text = enterprise?.enterpriseName
        
        mainView.buttonBack.addTarget(self, action: #selector(actBack), for: .touchUpInside)
    }
    
    @objc func actBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailEnterpriseViewController: DetailEnterpriseViewable, IndicatorProtocol {
    
    func showAlert(message: String) {
        
    }
    
    func getDetailEnterprise(idEnterprise: Int) {
        
    }
    
    func showLoading() {
        showActivityIndicator(in: self.loadingCustom)
    }

    func hideLoading() {
        hideActivityIndicator(in: self.loadingCustom)
    }
}
