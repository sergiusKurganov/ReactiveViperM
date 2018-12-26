//
//  CryptoMarketConfigurator.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

class CryptoMarketConfigurator {
    
    var presenter: CryptoMarketPresenter!
    var interactor: CryptoMarketInteractor!
    var router: CryptoMarketRouter!
    var view: CryptoMarketViewController!
    
    func configure(viewController: CryptoMarketViewController) {
        presenter = CryptoMarketPresenter()
        interactor = CryptoMarketInteractor()
        router = CryptoMarketRouter()
        view = viewController
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }
}
