//
//  CryptoCaseInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import RxSwift

protocol CryptoCaseInteractorInputProtocol: class {
    var caseMarkets: Variable<[Market]>? { get set }
}

protocol CryptoCaseInteractorOutputProtocol {
    func updateView(with caseMarkets: [Market])
}

final class CryptoCaseInteractor {
    
    var presenter: CryptoCaseInteractorOutputProtocol?
    
    var caseMarkets: Variable<[Market]>? {
        didSet {
            caseMarkets?.asObservable().subscribe(onNext: { [weak self] caseMarkets in
                guard let self = self else { return }
                self.presenter?.updateView(with: caseMarkets)
                }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        }
    }
    
    private let disposeBag = DisposeBag()
}

extension CryptoCaseInteractor: CryptoCaseInteractorInputProtocol {
}
