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
    func configureMarketModulePresenter(_ presenter: CryptoMarketModuleInputProtocol)
    func currencySegmentControlDidSelectCurrency(_ currency: CurrencyType)
}

final class MainViewController: UIViewController {
    
    var presenter: MainViewControllerOutputProtocol?
    
    private var cryptoMarketView = UIView()
    private var cryptoCaseView = UIView()
    private var currencySegmentControl = UISegmentedControl()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        currencySegmentControl.frame = CGRect(x: 0,
                                              y: 65,
                                              width: view.frame.width,
                                              height: 50)
        cryptoMarketView.frame = CGRect(x: 0,
                                        y: currencySegmentControl.frame.maxY,
                                        width: view.frame.width, height: 256)
        cryptoCaseView.frame = CGRect(x: 0,
                                      y: cryptoMarketView.frame.maxY,
                                      width: view.frame.width,
                                      height: view.frame.height / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
    }
}

extension MainViewController: MainViewControllerInputProtocol {
    func setupView() {
        cryptoMarketView = setCryptoMarketModule()
        view.addSubview(cryptoMarketView)
        cryptoCaseView = setCryptoCaseModule()
        view.addSubview(cryptoCaseView)
        
        setCurrencySegmentControl()
    }
}

extension MainViewController {
    private func setCryptoMarketModule() -> UIView {
        let cryptoMarket = ModuleFactory.getModule(.cryptoMarket) as! CryptoMarketConfigurator
        addChild(cryptoMarket.view)
        presenter?.configureMarketModulePresenter(cryptoMarket.presenter)
        return cryptoMarket.view.view
    }
    
    private func setCryptoCaseModule() -> UIView {
        let cryptoCase = ModuleFactory.getModule(.cryptoCase) as! CryptoCaseConfigurator
        addChild(cryptoCase.view)
        return cryptoCase.view.view
    }
    
    private func setCurrencySegmentControl() {
        view.addSubview(currencySegmentControl)
        currencySegmentControl.insertSegment(withTitle: "$", at: 0, animated: true)
        currencySegmentControl.insertSegment(withTitle: "₽", at: 1, animated: true)
        currencySegmentControl.insertSegment(withTitle: "€", at: 2, animated: true)
        currencySegmentControl.selectedSegmentIndex = 0
        currencySegmentControl.addTarget(self, action: #selector(changeCurrency(sender:)), for: .valueChanged)
    }
    
    @objc private func changeCurrency(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: presenter?.currencySegmentControlDidSelectCurrency(.dollar)
        case 1: presenter?.currencySegmentControlDidSelectCurrency(.ruble)
        case 2: presenter?.currencySegmentControlDidSelectCurrency(.euro)
        default: break
        }
    }
}
