//
//  CryptoMarketRouter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol CryptoMarketRouterInputProtocol: class {
}

protocol CryptoMarketRouterOutputProtocol {
}

final class CryptoMarketRouter {
    
    var presenter: CryptoMarketRouterOutputProtocol?
}

extension CryptoMarketRouter: CryptoMarketRouterInputProtocol {
}
