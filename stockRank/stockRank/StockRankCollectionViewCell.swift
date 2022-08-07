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
        companyPriceLabel.text = "\(convertToCurremcyFormat(price: stock.price)) 원"
        var color: UIColor
        
        if stock.diff > 0 {
            color = UIColor.systemRed
        } else {
            color = UIColor.systemBlue
        }
        diffLabel.textColor = color
        diffLabel.text = "\(stock.diff)%"
    }
    //소수점 3자리마다 ,를 찍어주는 코드
    func convertToCurremcyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}
