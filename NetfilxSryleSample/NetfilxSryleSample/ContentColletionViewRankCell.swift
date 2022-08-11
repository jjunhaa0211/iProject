//
//  ContentColletionViewRankCell.swift
//  NetfilxSryleSample
//
//  Created by 박준하 on 2022/08/12.
//

import UIKit

class ContentColletionViewRankCell : UICollectionViewCell {
    let imageView = UIImageView()
    let rankLable = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
            //contentView
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        //imageView
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        //rankLabel
        rankLable.font = .systemFont(ofSize: 100, weight: .black)
        rankLable.textColor = .white
        contentView.addSubview(rankLable)
        rankLable.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
    }
}
