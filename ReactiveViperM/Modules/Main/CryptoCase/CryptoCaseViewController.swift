//
//  CryptoCaseViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

protocol CryptoCaseViewControllerInputProtocol: class {
}

protocol CryptoCaseViewControllerOutputProtocol {
    func viewDidLoad()
}

final class CryptoCaseViewController: UIViewController {
    
    var presenter: CryptoCaseViewControllerOutputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0.5)
    }
}

extension CryptoCaseViewController: CryptoCaseViewControllerInputProtocol {
}
