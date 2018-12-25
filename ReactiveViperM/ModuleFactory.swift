//
//  ModuleFactory.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

enum ModuleType {
    case main
    case cryptoCase
    case cryptoMarket
}

class ModuleFactory {
    static func getModule(_ module: ModuleType) -> Any {
        switch module {
        case .main:
            let main = MainConfigurator()
            main.configure(viewController: MainViewController())
            return main
        case .cryptoCase:
            let cryptoCase = CryptoCaseConfigurator()
            cryptoCase.configure(viewController: CryptoCaseViewController())
            return cryptoCase
        case .cryptoMarket:
            let cryptoMarket = CryptoMarketConfigurator()
            cryptoMarket.configure(viewController: CryptoMarketViewController())
            return cryptoMarket
        }
    }
}
