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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 40
    }
    
    func configure(_ chat : Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    func formattedDateString(dateString: String) -> String {
        //2022-04-01 -> 4/1
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //문자열을 데이터로
        if let date = formatter.date(from: dateString){
            formatter.dateFormat = "M/d"
            
            return formatter.string(from: date)
        } else {
            return ""
        }
        
    }
}
