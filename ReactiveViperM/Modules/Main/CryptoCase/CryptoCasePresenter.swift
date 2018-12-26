//
//  CryptoCasePresenter.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

protocol CryptoCaseModuleOutputProtocol: class {
}

protocol CryptoCaseModuleInputProtocol {
    func configure(parentModule: CryptoCaseModuleOutputProtocol?)
}

final class CryptoCasePresenter {
    
    weak var parentModule: CryptoCaseModuleOutputProtocol?
    
    weak var view: CryptoCaseViewControllerInputProtocol?
    var interactor: CryptoCaseInteractorInputProtocol?
    weak var router: CryptoCaseRouterInputProtocol?
    
}

extension CryptoCasePresenter: CryptoCaseViewControllerOutputProtocol {
    func viewDidLoad() {
    }
}

extension CryptoCasePresenter: CryptoCaseInteractorOutputProtocol {
}

extension CryptoCasePresenter: CryptoCaseRouterOutputProtocol {
}

extension CryptoCasePresenter: CryptoCaseModuleInputProtocol {
    func configure(parentModule: CryptoCaseModuleOutputProtocol?) {
        guard let module = parentModule else { return }
        self.parentModule = module
    }
}
