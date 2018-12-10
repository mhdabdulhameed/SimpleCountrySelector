//
//  BindableType.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit
import RxSwift

protocol BindableType: class {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
