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
    func fetchMarketData(currency: CurrencyType)
    func fetchCoinData(with baseId: String)
    
    var markets: Variable<[Market]> { get set }
    var caseMarket: Variable<[Market]> { get set }
}

protocol MainInteractorOutputProtocol {
}

final class MainInteractor {
        
    var presenter: MainInteractorOutputProtocol!
    var markets = Variable<[Market]>([])
    var caseMarket = Variable<[Market]>([])
}

extension MainInteractor: MainInteractorInputProtocol {
    
    func fetchMarketData(currency: CurrencyType) {
        DataManager.shared.currentCurrency = currency
        let parameters: Parameters = ["quoteId" : currency.rawValue,
                                      "exchangeId" : "exmo"]
        DataManager
            .shared
            .getCryptoMarket(with: parameters,
                             success: { [weak self] markets in
                                guard let self = self else { return }
                                self.markets.value = markets
                                self.caseMarket.value = self.searchCaseMarket(with: markets)
                }, failure: { string in
                    print(string)
            })
    }
    
    func fetchCoinData(with baseId: String) {
        let parameters: Parameters = ["quoteId" : DataManager.shared.currentCurrency.rawValue,
                                      "exchangeId" : "exmo",
                                      "baseId" : baseId]
        DataManager
            .shared
            .getCryptoMarket(with: parameters,
                             success: { [weak self] markets in
                                guard let self = self else { return }
                                self.caseMarket.value = markets
                }, failure: { string in
                    print(string)
            })
    }
}

extension MainInteractor {
    private func searchCaseMarket(with markets: [Market]) -> [Market] {
        guard let baseIds = UserSettings.getBaseIds() else { return [Market]() }
        let caseMarket = markets.filter { baseIds.contains($0.baseId) }
        return caseMarket
    }
}
