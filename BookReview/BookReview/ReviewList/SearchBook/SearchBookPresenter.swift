//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

protocol SearchBookProtocol {
    
}

final class SearchBookPresenter: NSObject {
    private let viewController: SearchBookProtocol
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    
}
