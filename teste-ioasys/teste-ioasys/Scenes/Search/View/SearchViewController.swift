//
//  SearchViewController.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import UIKit
import Material

protocol SearchViewPresenting {
    func getCompanies()
    func showCompanies()
}

class SearchViewController: UIViewController {
    
    var mainView: SearchView { return self.view as! SearchView}
    private let presenter: SearchViewPresenting

    open var dataSourceItems = [DataSourceItem]()
    public var searchViewModel: SearchViewModel?
    public var loadingCustom: ActivityIndicatorCustom! = nil
    
    public var result: [Enterprise] = [] {
        didSet {
            self.mainView.tableView.reloadData()
            setEnterprises(enterprises: result)
        }
    }
    
    init(presenter: SearchViewPresenting) {
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
        let mainView = SearchView(frame: UIScreen.main.bounds)
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        configureKeyboard()
        
        loadingCustom = ActivityIndicatorCustom(viewController: self)
        loadingCustom.bg.backgroundColor = .clear
        
        searchViewModel = SearchViewModel(viewController: self)
        
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reusableIdentifier)
        
        self.mainView.tfSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func configureKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)

    }
    
    func configureTextField() {
        for view in mainView.viewSearch.subviews {
            if view .isKind(of: UITextField.self) {
                let textField = view as! UITextField
                textField.delegate = self
            }
        }
    }
    
    @objc func searchEnterprise(){
        showLoading()
        searchViewModel!.getEnterprisesWithName(text: mainView.tfSearch.text ?? "")
    }
    
    func setEnterprises(enterprises: [Enterprise]){
        
        if enterprises.count > 0 {
            mainView.tableView.isHidden = false
            mainView.lbResult.isHidden = false
            mainView.lbEmpty.isHidden = true
            
            if enterprises.count == 1 {
                mainView.lbResult.text = String(enterprises.count) + " resultado encontrado"
            }else{
                mainView.lbResult.text = String(enterprises.count) + " resultados encontrados"
            }
            
        }else{
            mainView.tableView.isHidden = true
            mainView.lbEmpty.isHidden = false
            mainView.lbResult.isHidden = true
        }
    }
    
    func openDetailEnterprise(enterprise: Enterprise){
//        let detailEnterpriseVC = DetailEnterpriseViewController()
//        detailEnterpriseVC.enterprise = enterprise
//        self.navigationController?.pushViewController(detailEnterpriseVC, animated: true)
    }
    
    // MARK: Keyboard Notifications
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        mainView.setOpenKeyboard(heightKeyboard: keyboardFrame.size.height)
        self.view.layoutIfNeeded()
       
        var contentInset: UIEdgeInsets = mainView.tableView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        
        mainView.tableView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        mainView.setCloseKeyboard()
        mainView.tableView.contentInset = .zero
        self.view.layoutIfNeeded()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

}

//MARK: SearchViewDelegate

extension SearchViewController: SearchViewDelegate {

    func didSelect(_ company: String) {
        #warning("TODO - Implement")
    }
}

extension SearchViewController: SearchViewable, IndicatorProtocol {

    func showLoading() {
        showActivityIndicator(in: self.loadingCustom)
    }

    func hideLoading() {
        hideActivityIndicator(in: self.loadingCustom)
    }

    func setCompanies() {

    }

    func showAlert(message: String) {

    }
}
