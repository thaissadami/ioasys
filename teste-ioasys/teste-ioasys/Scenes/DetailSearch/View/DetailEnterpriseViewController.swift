//
//  DetailEnterpriseViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import UIKit
import Material

class DetailEnterpriseViewController: UIViewController {
    
    var mainView: DetailEnterpriseView { return self.view as! DetailEnterpriseView}
    
    open var dataSourceItems = [DataSourceItem]()
    public var detailEnterpriseViewModel: DetailEnterpriseViewModel?
    public var loadingCustom: ActivityIndicatorCustom! = nil
//    public var enterprise: Enterprise?
    
    public var enterprise: Enterprise? = nil {
        didSet {
            self.mainView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        let mainView = DetailEnterpriseView(frame: UIScreen.main.bounds)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingCustom = ActivityIndicatorCustom(viewController: self)
        loadingCustom.bg.backgroundColor = .clear
    
        detailEnterpriseViewModel = DetailEnterpriseViewModel(viewController: self)
        
        if let enterpriseId = enterprise?.id {
            startLoading()
            detailEnterpriseViewModel?.getDetailEnterprise(id: enterpriseId)
        }
        
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
    
    func startLoading(){
        self.loadingCustom.show()
    }

    func stopLoading(){
        self.loadingCustom.dismiss()
    }
}
