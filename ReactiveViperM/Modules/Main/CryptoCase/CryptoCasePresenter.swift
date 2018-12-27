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
        guard let unwrappedView = view else { return }
        if unwrappedView.caseMarkets.count == 0 || unwrappedView.caseMarkets.first?.quoteId != caseMarkets.first?.quoteId {
            unwrappedView.caseMarkets = caseMarkets
            unwrappedView.reloadTableView()
        } else if !unwrappedView.caseMarkets.contains(where: { $0.baseId == caseMarkets.first?.baseId }) {
            view?.caseMarkets.insert(caseMarkets.first!, at: 0)
            view?.addRowsAtIndex(0)
        }
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
