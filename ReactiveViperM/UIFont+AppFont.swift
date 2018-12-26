//
//  UIFont+AppFont.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 26/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum FontType {
        case boldFont(CGFloat)
        case regularFont(CGFloat)
        case semibold(CGFloat)
    }
    
    static func appFont(_ fontType: FontType) -> UIFont {
        switch fontType {
        case let .boldFont(size):
            return .systemFont(ofSize: size, weight: .bold)
        case let .regularFont(size):
            return .systemFont(ofSize: size, weight: .regular)
        case let .semibold(size):
            return .systemFont(ofSize: size, weight: .semibold)
        }
    }
}
