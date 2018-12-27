//
//  CryptoCaseViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

protocol CryptoCaseViewControllerInputProtocol: class {
    func setupView()
    func reloadTableView()
    func addRowsAtIndex(_ index: Int)
    
    var caseMarkets: [Market] { get set }
}

protocol CryptoCaseViewControllerOutputProtocol {
    func viewDidLoad()
}

final class CryptoCaseViewController: UIViewController {
    
    var presenter: CryptoCaseViewControllerOutputProtocol?
    var caseMarkets = [Market]()
    
    private var tableView = UITableView(frame: .zero)
    private var coinCaseIdentifier = "CoinCaseIdentifier"
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0.5)
    }
}

extension CryptoCaseViewController: CryptoCaseViewControllerInputProtocol {
    func setupView() {
        cnofigureInterface()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func addRowsAtIndex(_ index: Int) {
        let indexPath: IndexPath = IndexPath(item: index, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
    }
}

private extension CryptoCaseViewController {
    private func cnofigureInterface() {
        setTableView()
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "CoinCaseTableViewCell", bundle: nil),
                           forCellReuseIdentifier: coinCaseIdentifier)
    }
}

extension CryptoCaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return caseMarkets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: coinCaseIdentifier, for: indexPath) as! CoinCaseTableViewCell
        cell.setData(coin: caseMarkets[indexPath.row])
        return cell
    }
}

extension CryptoCaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
