//
//  OnboardingIVewController.swift
//  NIKEOnboarding
//
//  Created by 박준하 on 2022/08/31.
//

import UIKit

class OnboardingVewController : UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let messages : [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
    }
}

extension OnboardingVewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else { return UICollectionViewCell()
        }
        let messge = messages[indexPath.item]
        cell.configure(messge)
        return cell
    }
    
    
}

extension OnboardingVewController : UICollectionViewDelegateFlowLayout {
    
}
