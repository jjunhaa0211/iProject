//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

protocol SearchBookProtocol {
    func setupViews()
    func dismiss()
    func reloadView()
}

protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    
    private let delegate: SearchBookDelegate
    
    private var books: [Book] = []
    
    init(viewController: SearchBookProtocol,
         delegate: SearchBookDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    //엔터가 눌어졌을 떄
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        bookSearchManager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var selectResults: [Book] = []
//        let selectedBook = selectResults[indexPath.row]
        let selectedBook = books[indexPath.row]
        delegate.selectBook(selectedBook)
        viewController.dismiss()
    }
}

extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = books[indexPath.row].title
        
        return cell
    }
}