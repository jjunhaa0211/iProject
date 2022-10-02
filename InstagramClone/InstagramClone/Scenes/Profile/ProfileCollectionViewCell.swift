//
//  ProfileCollectionViewCell.swift
//  InstagramClone
//
//  Created by 박준하 on 2022/10/02.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage){
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        imageView.backgroundColor = .tertiaryLabel
    }
}
