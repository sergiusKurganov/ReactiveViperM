//
//  MainRouter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol MainRouterInputProtocol {
}

protocol MainRouterOutputProtocol {
}

final class MainRouter {
    private var presenter: MainRouterOutputProtocol!
}

extension MainRouter: MainRouterInputProtocol {
}
