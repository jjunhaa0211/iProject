//
//  ChatListViewController.swift
//  chatList
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet var collectionVIew: UICollectionView!
    
    var chatList : [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVIew.dataSource = self
        collectionVIew.delegate = self
        
        //비교를해서 날짜순서로 출력하기
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else { return UICollectionViewCell()}
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
    
    
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
