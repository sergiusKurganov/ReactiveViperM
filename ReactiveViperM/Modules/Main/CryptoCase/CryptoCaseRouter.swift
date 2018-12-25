//
//  CryptoCaseRouter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol CryptoCaseRouterInputProtocol: class {
}

protocol CryptoCaseRouterOutputProtocol {
}

final class CryptoCaseRouter {
    
    var presenter: CryptoCaseRouterOutputProtocol?
    
}

extension CryptoCaseRouter: CryptoCaseRouterInputProtocol {
}

