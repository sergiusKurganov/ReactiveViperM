//
//  MarketResponse.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import SwiftyJSON

class MarketResponse {
   
    var data: [Market]
    
    required init() {
        data = [Market]()
    }
    
    func fromJSON(raw: JSON) {
        data = raw["data"].arrayValue.map { data in
            let market = Market()
            market.baseId = data["baseId"].stringValue
            market.priceUsd = data["priceUsd"].doubleValue
            market.rank = data["rank"].intValue
            market.baseSymbol = data["baseSymbol"].stringValue
            return market
        }
    }
}
