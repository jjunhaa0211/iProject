//
//  ChatListViewController.swift
//  chatList
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet var collectionVIew: UICollectionView!
    
    let chatList : [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVIew.dataSource = self
        collectionVIew.delegate = self
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
