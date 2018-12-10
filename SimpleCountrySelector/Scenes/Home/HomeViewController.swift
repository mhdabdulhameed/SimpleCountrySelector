//
//  HomeViewController.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController, BindableType {
    
    var viewModel: HomeViewModelType!
    
    lazy var selectCountryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("🇪🇬", for: .normal)
        return button
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSelectCountryButton()
    }
    
    func bindViewModel() {
        let inputs = viewModel.inputs
        let outputs = viewModel.outputs
        
        selectCountryButton.rx.action = inputs.selectCountryAction
        
        outputs.buttonTitle
            .map { $0.name }
            .drive(selectCountryButton.rx.title())
            .disposed(by: disposeBag)
    }
    
    private func addSelectCountryButton() {
        view.addSubview(selectCountryButton)
        
        selectCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectCountryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
