//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

protocol SearchBookProtocol {
    func setupViews()
}

final class SearchBookPresenter: NSObject {
    private let viewController: SearchBookProtocol
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    
}

extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchBookPresenter: UITableViewDataSource {
    
}
