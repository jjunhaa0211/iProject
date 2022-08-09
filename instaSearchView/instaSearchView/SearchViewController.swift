//
//  SearchViewController.swift
//  instaSearchView
//
//  Created by 박준하 on 2022/08/08.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.estimatedItemSize = .zero
        }
        
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        //타이틀이름은 search로 하겠다
        searchController.searchBar.placeholder = "Search"
        //업데이트
        searchController.searchResultsUpdater = self
        //이걸로 가져오겠다
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else { return UICollectionViewCell()}
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
    
    
}

extension SearchViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing : CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let heigh = width
        return CGSize(width: width, height: heigh)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
extension SearchViewController : UISearchResultsUpdating {
    
    //내가 친 것들 인식
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search!)")
    }
    
}
