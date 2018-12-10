//
//  Scene+ViewController.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .home(let viewModel):
            let viewController = HomeViewController()
            viewController.bindViewModel(to: viewModel)
            return viewController
            
        case .countrySelector(let viewModel):
            let viewController = CountrySelectorViewController()
            let navigationController =  UINavigationController(rootViewController: viewController)
            viewController.bindViewModel(to: viewModel)
            return navigationController
        }
    }
}
