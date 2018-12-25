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
    weak var interactor: MainInteractorInputProtocol?
    weak var router: MainRouterInputProtocol?
}

extension MainPresenter: MainViewControllerOutputProtocol {
    func viewDidLoad() {
        view?.setupView()
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
}

extension MainPresenter: MainRouterOutputProtocol {
}
