//
//  CryptoMarketViewController.swift
//  ReactiveViperM
//
//  Created by Курганов Сергей Владимирович on 25/12/2018.
//  Copyright © 2018 Курганов Сергей Владимирович. All rights reserved.
//

import UIKit

protocol CryptoMarketViewControllerInputProtocol: class {
    func setupView()
    
    var markets: [Market] { get set }
}

protocol CryptoMarketViewControllerOutputProtocol {
    func viewDidLoad()
    func collectionViewDidSelectMarket(with baseId: String)
}

final class CryptoMarketViewController: UIViewController {
    
    var presenter: CryptoMarketViewControllerOutputProtocol?
    var markets = [Market]() {
        didSet {
            guard (collectionView != nil) else { return }
            collectionView.reloadData()
        }
    }
    
    private var collectionView: UICollectionView!
    private var marketCellIdentifier = "MarketCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

extension CryptoMarketViewController: CryptoMarketViewControllerInputProtocol {
    func setupView() {
        cnofigureInterface()
    }
}

extension CryptoMarketViewController {
    private func cnofigureInterface() {
        setCollectionView()
    }
    
    private func setCollectionView() {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 256)
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
  
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "MarketCollectionViewCell", bundle: nil),
                                         forCellWithReuseIdentifier: marketCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CryptoMarketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140.0, height: 240.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.collectionViewDidSelectMarket(with: markets[indexPath.row].baseId)
    }
}

extension CryptoMarketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return markets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: marketCellIdentifier, for: indexPath) as! MarketCollectionViewCell
        cell.setData(market: markets[indexPath.row])
        return cell
    }
}

