//
//  UserSettings.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 26/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation

class UserSettings: UserDefaults {
    
    static func setBaseIds(baseIds: [String]) {
        UserDefaults.standard.set(baseIds, forKey: "baseIds")
    }
    
    static func getBaseIds() -> [String]? {
        let baseIds = UserDefaults.standard.array(forKey: "baseIds") as? [String]
        return baseIds
    }
}
