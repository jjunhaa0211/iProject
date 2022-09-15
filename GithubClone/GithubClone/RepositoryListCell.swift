//
//  RepositoryListCell.swift
//  GithubClone
//
//  Created by 박준하 on 2022/09/15.
//

import UIKit
import SnapKit

final class RepositoryListCell : UITableViewCell {
    var repository: String?
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let starImageVeiw = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [
            nameLabel,descriptionLabel,
            starImageVeiw,starLabel,languageLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        
    }
}
