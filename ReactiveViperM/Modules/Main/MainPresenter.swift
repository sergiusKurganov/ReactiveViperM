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
        interactor?.fetchMarketData(currency: .dollar)
    }
    
    func configureMarketModulePresenter(_ presenter: CryptoMarketModuleInputProtocol) {
        presenter.configure(parentModule: self,
                            markets: (interactor?.markets)!)
    }
    
    func configureCaseModulePresenter(_ presenter: CryptoCaseModuleInputProtocol) {
        presenter.configure(parentModule: self,
                            caseMarket: (interactor?.caseMarket)!)
    }
    
    func currencySegmentControlDidSelectCurrency(_ currency: CurrencyType) {
        interactor?.fetchMarketData(currency: currency)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
}

extension MainPresenter: MainRouterOutputProtocol {
}

extension MainPresenter: CryptoMarketModuleOutputProtocol {
    func didSelectBaseId(_ id: String) {
        interactor?.fetchCoinData(with: id)
    }
}

extension MainPresenter: CryptoCaseModuleOutputProtocol {
}
