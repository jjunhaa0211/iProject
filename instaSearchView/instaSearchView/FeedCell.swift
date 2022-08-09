//
//  FeedCell.swift
//  instaSearchView
//
//  Created by 박준하 on 2022/08/09.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet var thubmnailImageVeiw: UIImageView!
    
    func configure(_ imageName: String){
        thubmnailImageVeiw.image = UIImage(named: imageName)
    }
}
