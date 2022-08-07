//
//  StockRankCollectionViewCell.swift
//  stockRank
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var companyIconImageView: UIImageView!
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var companyPriceLabel: UILabel!
    @IBOutlet var diffLabel: UILabel!
    
    func configure(_ stock : StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(stock.price) 원"
        diffLabel.text = "\(stock.diff)%"
    }
}
