//
//  CryptoMarketPresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol CryptoMarketModuleOutputProtocol {
}

protocol CryptoMarketModuleInputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?,
                   markets: Variable<[Market]>)
}

final class CryptoMarketPresenter {
    
    var parentModule: CryptoMarketModuleOutputProtocol?
    
    weak var view: CryptoMarketViewControllerInputProtocol?
    var interactor: CryptoMarketInteractorInputProtocol?
    weak var router: CryptoMarketRouterInputProtocol?
    
}

extension CryptoMarketPresenter: CryptoMarketViewControllerOutputProtocol {
    func viewDidLoad() {
        view?.setupView()
    }
}

extension CryptoMarketPresenter: CryptoMarketInteractorOutputProtocol {
    func updateView(with market: [Market]) {
        view?.markets = market
    }
}

extension CryptoMarketPresenter: CryptoMarketRouterOutputProtocol {
}

extension CryptoMarketPresenter: CryptoMarketModuleInputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?,
                   markets: Variable<[Market]>) {
        guard let module = parentModule else { return }
        self.parentModule = module
        self.interactor?.market = markets
    }
}
