//
//  MainViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

protocol MainViewControllerInputProtocol: class {
    func setupView()
}

protocol MainViewControllerOutputProtocol {
    func viewDidLoad()
}

final class MainViewController: UIViewController {
    
    var presenter: MainViewControllerOutputProtocol?
    
    private var cryptoMarketView = UIView()
    private var cryptoCaseView = UIView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cryptoMarketView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2)
        cryptoCaseView.frame = CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        presenter?.viewDidLoad()
    }
}

extension MainViewController: MainViewControllerInputProtocol {
    func setupView() {
        cryptoMarketView = cryptoMarket()
        view.addSubview(cryptoMarketView)
        cryptoCaseView = setCryptoCase()
        view.addSubview(cryptoCaseView)
    }
}

extension MainViewController {
    private func cryptoMarket() -> UIView {
        let cryptoMarket = ModuleFactory.getModule(.cryptoMarket) as! CryptoMarketConfigurator
        addChild(cryptoMarket.view)
        return cryptoMarket.view.view
    }
    
    private func setCryptoCase() -> UIView {
        let cryptoCase = ModuleFactory.getModule(.cryptoCase) as! CryptoCaseConfigurator
        addChild(cryptoCase.view)
        return cryptoCase.view.view
    }
}
