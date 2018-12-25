//
//  MainConfigurator.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

class MainConfigurator {
    
    var presenter: MainPresenter!
    var interactor: MainInteractor!
    var router: MainRouter!
    var view: MainViewController!
    
    func configure(viewController: MainViewController) {
        presenter = MainPresenter()
        interactor = MainInteractor()
        router = MainRouter()
        view = viewController
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
    }
}
