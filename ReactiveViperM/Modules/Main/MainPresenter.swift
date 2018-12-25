//
//  MainPresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

class MainPresenter {
    var view: MainViewControllerInputProtocol!
    var interactor: MainInteractorInputProtocol!
    var router: MainRouterInputProtocol!
}

extension MainPresenter: MainViewControllerOutputProtocol {
}

extension MainPresenter: MainInteractorOutputProtocol {
}

extension MainPresenter: MainRouterOutputProtocol {
}
