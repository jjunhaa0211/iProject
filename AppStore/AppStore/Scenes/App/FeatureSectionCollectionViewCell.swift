//
//  FeatureSectionCollectionViewCell.swift
//  AppStore
//
//  Created by 박준하 on 2022/09/06.
//

import SnapKit
import UIKit

final class FeatureSectionCollectionViewCell : UICollectionViewCell {
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var appNameLabel : UILabel = {
        let label  = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLable : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    func setup() {
        setupLayout()
        
        typeLabel.text = "type"
        appNameLabel.text = "app Name"
        descriptionLable.text = "descriptionLable"
        imageView.backgroundColor = .lightGray
    }
}

private extension FeatureSectionCollectionViewCell {
    
    func setupLayout() {
        [
            typeLabel,
            appNameLabel,
            descriptionLable,
            imageView
        ].forEach { addSubview($0) }
        
        typeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(typeLabel.snp.bottom)
        }
        
        descriptionLable.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(appNameLabel.snp.bottom).inset(4.0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(descriptionLable.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(8.0)
        }
        
    }
}

