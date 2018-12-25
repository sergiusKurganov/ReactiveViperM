//
//  MainViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit
import RxSwift


protocol MainViewControllerInputProtocol {
}

protocol MainViewControllerOutputProtocol {
}

final class MainViewController: UIViewController {
    
    private var presenter: MainViewControllerOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: MainViewControllerInputProtocol {
    
}
