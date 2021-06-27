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
    
    public var result: Enterprise? = nil {
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
        
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reusableIdentifier)
    }
    
    
}
