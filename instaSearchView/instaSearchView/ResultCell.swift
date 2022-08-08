//
//  ResultCollectionViewCell.swift
//  instaSearchView
//
//  Created by 박준하 on 2022/08/08.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet var thumbnailImageView: UIImageView!
    
    //재사용할 때 사용
    override func prepareForReuse() {
        super.prepareForReuse()
        //image reset
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName : String){
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
