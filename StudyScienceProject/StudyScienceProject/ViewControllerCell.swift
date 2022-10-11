//
//  ViewControllerCell.swift
//  StudyScienceProject
//
//  Created by 박준하 on 2022/10/11.
//


import SnapKit
import UIKit

final class ViewControllCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        imageView = UIImageView(image: UIImage(named: "너구리"))
        return imageView
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "snagjin_O님 외 여러명이 좋아합니다."
        
        return label
    }()
    
    private lazy var contensLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "sangjin_O : 깨어나렴!"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 11.0, weight: .semibold)
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        [
            postImageView,
            currentLikedCountLabel,
            contensLabel,
            dateLabel
        ].forEach { addSubview($0) }

        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }

        let buttonInset: CGFloat = 16.0

        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(postImageView.snp.leading).inset(buttonInset)
            $0.trailing.equalTo(postImageView.snp.trailing).inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(14.0)
        }

        let labelVerticalSpacing: CGFloat = 8.0

        contensLabel.snp.makeConstraints {
            $0.leading.equalTo(currentLikedCountLabel.snp.leading)
            $0.trailing.equalTo(currentLikedCountLabel.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(labelVerticalSpacing)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(contensLabel.snp.leading)
            $0.trailing.equalTo(contensLabel.snp.trailing)
            $0.top.equalTo(contensLabel.snp.bottom).offset(labelVerticalSpacing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
