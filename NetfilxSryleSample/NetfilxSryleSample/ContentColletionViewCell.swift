//
//  ContentColletionViewCell.swift
//  NetfilxSryleSample
//
//  Created by 박준하 on 2022/08/11.
//

import UIKit
import SnapKit

class ContentColletionViewCell : UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

