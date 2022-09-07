//
//  RankingFeatureSectionViewCell.swift
//  AppStore
//
//  Created by 박준하 on 2022/09/07.
//

import UIKit
import SnapKit

final class RankingFeatureSectionViewCell : UICollectionViewCell {
        static var heigt: CGFloat { 70.0 }

    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptiorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구매"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup() {
        setupLayout()
        
        titleLabel.text = "앱 이름"
        descriptiorLabel.text = "이런이런 앱입니다"
        //랜덤
        inAppPurchaseInfoLabel.isHidden = [true, false].randomElement() ?? true
    }
}

private extension RankingFeatureSectionViewCell {
    func setupLayout() {
        [ imageView,
          titleLabel,
          descriptiorLabel,
          downloadButton,
          inAppPurchaseInfoLabel
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4.0)
            $0.bottom.equalToSuperview().inset(4.0)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24.0)
            $0.width.equalTo(24.0)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints {
            $0.centerX.equalTo(downloadButton.snp.trailing).offset(8.0)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8.0)
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(imageView.snp.top).inset(8.0)
        }
        
        descriptiorLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
    }
}
