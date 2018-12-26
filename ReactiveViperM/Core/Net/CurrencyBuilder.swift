//
//  CurrencyBuilder.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 26/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

enum CurrencyType: String {
    case dollar = "united-states-dollar"
    case ruble = "russian-ruble"
    case euro = "euro"
    case unknown
}

class CurrencyBuilder {
    static func currencyType(for string: String) -> CurrencyType {
        return CurrencyType.init(rawValue: string) ?? .unknown
    }
}
