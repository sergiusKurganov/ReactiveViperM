//
//  CryptoMarketInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol CryptoMarketInteractorInputProtocol: class {
}

protocol CryptoMarketInteractorOutputProtocol {
}

final class CryptoMarketInteractor {
    
    var presenter: CryptoMarketInteractorOutputProtocol?
    
}

extension CryptoMarketInteractor: CryptoMarketInteractorInputProtocol {
}
