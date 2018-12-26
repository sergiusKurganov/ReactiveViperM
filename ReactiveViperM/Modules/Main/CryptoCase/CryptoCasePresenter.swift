//
//  CryptoCasePresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol CryptoCaseModuleOutputProtocol: class {
}

protocol CryptoCaseModuleInputProtocol {
    func configure(parentModule: CryptoCaseModuleOutputProtocol?,
                   caseMarket: Variable<[Market]>)
}

final class CryptoCasePresenter {
    
    weak var parentModule: CryptoCaseModuleOutputProtocol?
    
    weak var view: CryptoCaseViewControllerInputProtocol?
    var interactor: CryptoCaseInteractorInputProtocol?
    var router: CryptoCaseRouterInputProtocol?
    
}

extension CryptoCasePresenter: CryptoCaseViewControllerOutputProtocol {
    func viewDidLoad() {
        view?.setupView()
    }
}

extension CryptoCasePresenter: CryptoCaseInteractorOutputProtocol {
    func updateView(with caseMarkets: [Market]) {
        view?.caseMarkets = caseMarkets
    }
}

extension CryptoCasePresenter: CryptoCaseRouterOutputProtocol {
}

extension CryptoCasePresenter: CryptoCaseModuleInputProtocol {
    func configure(parentModule: CryptoCaseModuleOutputProtocol?,
                   caseMarket: Variable<[Market]>) {
        guard let module = parentModule else { return }
        self.parentModule = module
        self.interactor?.caseMarkets = caseMarket
    }
}
