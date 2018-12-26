//
//  MainInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol MainInteractorInputProtocol: class {
    func getMarketData(currency: CurrencyType)
    
    var markets: Variable<[Market]> { get set }
}

protocol MainInteractorOutputProtocol {
}

final class MainInteractor {
        
    var presenter: MainInteractorOutputProtocol!
    var markets = Variable<[Market]>([])
}

extension MainInteractor: MainInteractorInputProtocol {
    
    func getMarketData(currency: CurrencyType) {
        let parameters: Parameters = ["quoteId" : currency.rawValue,
                                      "exchangeId" : "exmo"]
        DataManager
            .shared
            .getCryptoMarket(with: parameters,
                             success: { [weak self] markets in
                                guard let self = self else { return }
                                self.markets.value = markets },
                             failure: { string in
                                print(string)
            })
    }
}
