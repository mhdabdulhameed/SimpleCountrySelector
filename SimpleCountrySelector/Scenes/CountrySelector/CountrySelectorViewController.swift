//
//  CountrySelectorViewController.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class CountrySelectorViewController: UIViewController, BindableType {
    
    var viewModel: CountrySelectorViewModelType!
    
    typealias CountriesListSectionModel = SectionModel<String, CountryViewModel>
    
    lazy var countriesTableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    lazy var cancelBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        return barButtonItem
    }()
    
    private let disposeBag = DisposeBag()
    private var dataSource: RxTableViewSectionedReloadDataSource<CountriesListSectionModel>!
    
    func bindViewModel() {
        let inputs = viewModel.inputs
        let outputs = viewModel.outputs
        
        cancelBarButtonItem.rx.action = inputs.closeAction
        
        outputs.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        outputs.countries
            .map { [CountriesListSectionModel(model: "", items: $0)] }
            .drive(countriesTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        
        addCountriesTableView()
    }
    
    private func addCountriesTableView() {
        
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "countriesListTableViewCellIdentifier")
        dataSource = RxTableViewSectionedReloadDataSource<CountriesListSectionModel>(configureCell:  tableViewDataSource)
        
        view.addSubview(countriesTableView)
        
        countriesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        countriesTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        countriesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private var tableViewDataSource: TableViewSectionedDataSource<CountriesListSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, cellModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "countriesListTableViewCellIdentifier")!
            cell.textLabel?.text = cellModel.name
            
            return cell
        }
    }
}
