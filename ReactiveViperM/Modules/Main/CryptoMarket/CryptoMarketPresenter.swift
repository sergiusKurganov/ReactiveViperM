//
//  CryptoMarketPresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol CryptoMarketModuleOutputProtocol: class {
    func didSelectBaseId(_ id: String)
}

protocol CryptoMarketModuleInputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?,
                   markets: Variable<[Market]>)
}

final class CryptoMarketPresenter {
    
    weak var parentModule: CryptoMarketModuleOutputProtocol?
    
    weak var view: CryptoMarketViewControllerInputProtocol?
    var interactor: CryptoMarketInteractorInputProtocol?
    var router: CryptoMarketRouterInputProtocol?
    
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
    
    func collectionViewDidSelectMarket(with baseId: String) {
        interactor?.saveBaseId(baseId)
        parentModule?.didSelectBaseId(baseId)
    }
}

extension CryptoMarketPresenter: CryptoMarketRouterOutputProtocol {
}

extension CryptoMarketPresenter: CryptoMarketModuleInputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?,
                   markets: Variable<[Market]>) {
        guard let module = parentModule else { return }
        self.parentModule = module
        self.interactor?.markets = markets
    }
}
