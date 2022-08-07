//
//  ChatListCollectionViewCell.swift
//  chatList
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configure(_ chat : Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = chat.date
    }
}
