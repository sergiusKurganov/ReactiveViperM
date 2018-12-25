//
//  CryptoMarketPresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol CryptoMarketModuleOutputProtocol: class {
}

protocol CryptoMarketModuleInputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?)
}

final class CryptoMarketPresenter {
    
    weak var parentModule: CryptoMarketModuleOutputProtocol?
    
    weak var view: CryptoMarketViewControllerInputProtocol?
    weak var interactor: CryptoMarketInteractorInputProtocol?
    weak var router: CryptoMarketRouterInputProtocol?
    
}

extension CryptoMarketPresenter: CryptoMarketViewControllerOutputProtocol {
    func viewDidLoad() {
    }
}

extension CryptoMarketPresenter: CryptoMarketInteractorOutputProtocol {
}

extension CryptoMarketPresenter: CryptoMarketRouterOutputProtocol {
}

extension CryptoMarketPresenter: CryptoMarketModuleOutputProtocol {
    func configure(parentModule: CryptoMarketModuleOutputProtocol?) {
        guard let module = parentModule else { return }
        self.parentModule = module
    }
}
