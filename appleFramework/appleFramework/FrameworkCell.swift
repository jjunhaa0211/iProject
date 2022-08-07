//
//  FrameworkCell.swift
//  appleFramework
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
        
        
    }
}
