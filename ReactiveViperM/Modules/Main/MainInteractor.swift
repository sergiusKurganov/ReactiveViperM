//
//  MainInteractor.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation


protocol MainInteractorInputProtocol {
}

protocol MainInteractorOutputProtocol {
}

final class MainInteractor {
    private var presenter: MainInteractorOutputProtocol!
}

extension MainInteractor: MainInteractorInputProtocol {
}
