//
//  HomeViewModel.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import Action
import RxSwift
import RxCocoa

protocol HomeViewModelInput {
    var selectCountryAction: CocoaAction { get }
}

protocol HomeViewModelOutput {
    var buttonTitle: Driver<CountryViewModel> { get }
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInput { get }
    var outputs: HomeViewModelOutput { get }
}

final class HomeViewModel: HomeViewModelType, HomeViewModelInput, HomeViewModelOutput {
    
    // MARK: - Inputs & Outputs
    
    var inputs: HomeViewModelInput { return self }
    var outputs: HomeViewModelOutput { return self }
    
    lazy var selectCountryAction: CocoaAction = {
        return CocoaAction { [unowned self] _ in
            let countrySelectorViewModel = CountrySelectorViewModel(sceneCoordinator: self.sceneCoordinator, onSelectCountry: self.onSelectCountry())
            self.sceneCoordinator.transition(to: .countrySelector(countrySelectorViewModel), type: .modal)
            return .empty()
        }
    }()
    
    var buttonTitle: Driver<CountryViewModel> {
        return buttonTitleProperty
            .asDriver(onErrorJustReturn: CountryViewModel(countryFlag: Utils.countryCodeToFlag(code: "EG"),
                                                          countryCode: "EG",
                                                          countryName: "Egypt"))
    }
    
    // MARK: Private Properties
    
    private let sceneCoordinator: SceneCoordinatorType
    private let disposeBag = DisposeBag()
    private let buttonTitleProperty = BehaviorSubject<CountryViewModel>(value: CountryViewModel(countryFlag: Utils.countryCodeToFlag(code: "EG"),
                                                                                                countryCode: "EG",
                                                                                                countryName: "Egypt"))
    
    // MARK: - Initialization
    
    init(sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
    }
    
    func onSelectCountry() -> Action<CountryViewModel, Void> {
        return Action { [unowned self] selectedCountry in
            self.buttonTitleProperty.onNext(selectedCountry)
            return .empty()
        }
    }
}
