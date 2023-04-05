//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

final class SearchBookViewController: UIViewController {
    
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    
}

extension SearchBookViewController: SearchBookProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let searchContoller = UISearchController()
        
        //백그라운 어둡게
        searchContoller.obscuresBackgroundDuringPresentation = false
        searchContoller.searchBar.delegate = presenter
        
        navigationItem.searchController = searchContoller
    }
}
