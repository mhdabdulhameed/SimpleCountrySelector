//
//  CountrySelectorViewModel.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

protocol CountrySelectorViewModelInput {
    
}

protocol CountrySelectorViewModelOutput {
    
}

protocol CountrySelectorViewModelType {
    
}

final class CountrySelectorViewModel: CountrySelectorViewModelType, CountrySelectorViewModelInput, CountrySelectorViewModelOutput {
    
    // MARK: - Inputs & Outputs
    
    // MARK: Private Properties
    
    private let sceneCoordinator: SceneCoordinatorType
    
    // MARK: - Initialization
    
    init(sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
    }
}
