//
//  MarketCollectionViewCell.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 26/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketImageView: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var inlayButton: UIButton!
    
     private var currencyFormatter = NumberFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension MarketCollectionViewCell {
    func setData(market: Market) {
        
        nameLabel.font = .appFont(.regularFont(14))
        nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        nameLabel.textAlignment = .left
        nameLabel.text = market.baseId.uppercased()
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 3
        
        var identifier = "en_US"
        switch market.quoteId {
        case .dollar:
            identifier = "en_US"
        case .ruble:
            identifier = "ru_RU"
        case .euro:
            identifier = "fr_FR"
        default: break
        }
        
        currencyFormatter.locale = Locale(identifier: identifier)
    
        priceLable.font = .appFont(.boldFont(14))
        priceLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        priceLable.textAlignment = .left
        priceLable.text = currencyFormatter.string(from: NSNumber(value: market.priceQuote))!
        
        inlayButton.isUserInteractionEnabled = false
        inlayButton.layer.cornerRadius = 8.0
        let image = UIImage(named: market.baseSymbol)
        marketImageView.image = image ?? UIImage(named: "icon_common_market")
    }
}
