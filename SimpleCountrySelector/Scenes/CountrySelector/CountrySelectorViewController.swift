//
//  CountrySelectorViewController.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit

final class CountrySelectorViewController: UIViewController, BindableType {
    
    var viewModel: CountrySelectorViewModelType!
    
    lazy var countriesTableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCountriesTableView()
    }
    
    private func addCountriesTableView() {
        view.addSubview(countriesTableView)
        
        countriesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        countriesTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        countriesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
