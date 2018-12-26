//
//  CryptoMarketInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol CryptoMarketInteractorInputProtocol: class {
    func saveBaseId(_ baseId: String)
    
    var markets: Variable<[Market]>?  { get set }
}

protocol CryptoMarketInteractorOutputProtocol {
    func updateView(with market: [Market])
}

final class CryptoMarketInteractor {
    
    var presenter: CryptoMarketInteractorOutputProtocol?
    var markets: Variable<[Market]>? {
        didSet {
            markets?.asObservable().subscribe(onNext: { [weak self] markets in
                guard let self = self else { return }
                self.presenter?.updateView(with: markets)
                }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        }
    }
    
    private let disposeBag = DisposeBag()
}

extension CryptoMarketInteractor: CryptoMarketInteractorInputProtocol {
    func saveBaseId(_ baseId: String) {
        var ids = [String]()
        if let baseIds = UserSettings.getBaseIds() {
            guard !baseIds.contains(baseId) else { return }
            ids = baseIds
        }
        ids.append(baseId)
        UserSettings.setBaseIds(baseIds: ids)
    }
}
