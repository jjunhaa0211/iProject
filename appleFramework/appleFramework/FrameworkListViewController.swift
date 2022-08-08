//
//  FrameWorkViewController.swift
//  appleFramework
//
//  Created by 박준하 on 2022/08/07.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let list : [AppleFramework] = AppleFramework.list
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "⭐️Apple Framework"
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            //estimatedItemSize = 자동으로 시스템 설정
            flowlayout.estimatedItemSize = .zero
        }
        
        //패딩을 주는 코드
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 10)
    }
}

extension FrameworkListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else { return UICollectionViewCell() }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
    
    
}

extension FrameworkListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
