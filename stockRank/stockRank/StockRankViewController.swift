//
//  StockRankViewController.swift
//  stockRank
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self // 어떤데이터 어떻게 표현 할 꺼야?
        collectionView.delegate = self // 어떻게 배치할 꺼야?

    }
}

extension StockRankViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    //cell을 어떻게 표현 할꺼야?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //guard는 꼭참이어야하는 조건
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else { return UICollectionViewCell() }
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

//cell들을 어떻게 배치할 것인가?
extension StockRankViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 80)
        
    }
}
