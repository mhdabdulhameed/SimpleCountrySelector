//
//  CountrySelectorViewModel.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import Action
import RxSwift
import RxCocoa

protocol CountrySelectorViewModelInput {
    var closeAction: CocoaAction { get }
}

protocol CountrySelectorViewModelOutput {
    var title: Driver<String> { get }
    var countries: Driver<[CountryViewModel]> { get }
}

protocol CountrySelectorViewModelType {
    var inputs: CountrySelectorViewModelInput { get }
    var outputs: CountrySelectorViewModelOutput { get }
}

final class CountrySelectorViewModel: CountrySelectorViewModelType, CountrySelectorViewModelInput, CountrySelectorViewModelOutput {
    
    // MARK: - Inputs & Outputs
    
    var inputs: CountrySelectorViewModelInput { return self }
    var outputs: CountrySelectorViewModelOutput { return self }
    
    lazy var closeAction: CocoaAction = {
        CocoaAction { [unowned self] _ in
            self.sceneCoordinator.pop(animated: true)
            return .empty()
        }
    }()
    
    var title: Driver<String> {
        let title = "Country Selector"
        return Observable.just(title).asDriver(onErrorJustReturn: title)
    }
    
    var countries: Driver<[CountryViewModel]> {
        return Utils.getCountryCodes().asDriver(onErrorJustReturn: [])
    }
    
    // MARK: Private Properties
    
    private let sceneCoordinator: SceneCoordinatorType
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    
    init(sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
    }
}
