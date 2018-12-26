//
//  Market.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

class Market {
    var baseId = ""
    var rank: Int = 0
    var baseSymbol = ""
    var priceUsd: Double = 0.0
    var priceQuote: Double = 0.0
    var quoteId: CurrencyType = .unknown
}
//"id": "bitcoin",
//"rank": "1",
//"symbol": "BTC",
//"name": "Bitcoin",
//"supply": "17193925.0000000000000000",
//"maxSupply": "21000000.0000000000000000",
//"marketCapUsd": "119150835874.4699281625807300",
//"volumeUsd24Hr": "2927959461.1750323310959460",
//"priceUsd": "6929.8217756835584756",
//"changePercent24Hr": "-0.8101417214350335",
//"vwap24Hr": "7175.0663247679233209"
