//
//  MainPresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

final class MainPresenter {
    weak var view: MainViewControllerInputProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterInputProtocol?
}

extension MainPresenter: MainViewControllerOutputProtocol {
    func viewDidLoad() {
        view?.setupView()
        interactor?.getMarketData(currency: .dollar)
    }
    
    func configureMarketModulePresenter(_ presenter: CryptoMarketModuleInputProtocol) {
        presenter.configure(parentModule: self,
                            markets: (interactor?.markets)!)
    }
    
    func currencySegmentControlDidSelectCurrency(_ currency: CurrencyType) {
        interactor?.getMarketData(currency: currency)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
}

extension MainPresenter: MainRouterOutputProtocol {
}

extension MainPresenter: CryptoMarketModuleOutputProtocol {
}
