//
//  OnboardingCell.swift
//  NIKEOnboarding
//
//  Created by 박준하 on 2022/08/31.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
//    @IBOutlet var thumbnailImageView: UIImageView!
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(_ messge: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: messge.imageName)
        titleLabel.text = messge.title
        descriptionLabel.text = messge.description
    }
}
