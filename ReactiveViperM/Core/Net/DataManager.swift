//
//  DataManager.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {
    
    private init() {}
    static let shared = DataManager()
    
    func getCryptoMarket(success: (([Market]) -> Void)? = nil,
                         failure: ((String) -> Void)? = nil) {
        Alamofire.request(URL(string: "https://api.coincap.io/v2/markets")!,
                          method: .get,
                          parameters: [:],
                          headers: nil).responseJSON { responseJSON in
                            switch responseJSON.result {
                            case .success:
                                let json = JSON(responseJSON.value as Any)
                                let market = MarketResponse()
                                market.fromJSON(raw: json)
                                success!(market.data)
                            case .failure(let error):
                                failure!(error.localizedDescription)
                            }
        }
    }
}
