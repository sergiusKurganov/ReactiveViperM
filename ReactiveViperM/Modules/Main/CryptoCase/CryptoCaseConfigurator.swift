//
//  CryptoCaseConfigurator.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

class CryptoCaseConfigurator {
    
    var presenter: CryptoCasePresenter!
    var interactor: CryptoCaseInteractor!
    var router: CryptoCaseRouter!
    var view: CryptoCaseViewController!
    
    func configure(viewController: CryptoCaseViewController) {
        presenter = CryptoCasePresenter()
        interactor = CryptoCaseInteractor()
        router = CryptoCaseRouter()
        view = viewController
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }
}
