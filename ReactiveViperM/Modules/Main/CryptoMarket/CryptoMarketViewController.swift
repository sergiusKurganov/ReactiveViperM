//
//  CryptoMarketViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

protocol CryptoMarketViewControllerInputProtocol: class {
}

protocol CryptoMarketViewControllerOutputProtocol {
    func viewDidLoad()
}

final class CryptoMarketViewController: UIViewController {
    
    var presenter: CryptoMarketViewControllerOutputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.5)
    }
}

extension CryptoMarketViewController: CryptoMarketViewControllerInputProtocol {
}
