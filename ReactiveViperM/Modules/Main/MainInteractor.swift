//
//  MainInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol MainInteractorInputProtocol: class {
    func getMarketData()
    var markets: Variable<[Market]> { get set }
}

protocol MainInteractorOutputProtocol {
}

final class MainInteractor {
    var presenter: MainInteractorOutputProtocol!
    var markets = Variable<[Market]>([])
}

extension MainInteractor: MainInteractorInputProtocol {
    func getMarketData() {
        DataManager.shared.getCryptoMarket(success: { [weak self] markets in
            guard let self = self else { return }
            self.markets.value = markets
        },failure: { string in
            print(string)
        })
    }
    
    
    
}
