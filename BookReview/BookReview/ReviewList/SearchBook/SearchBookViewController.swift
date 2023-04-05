//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//
import SnapKit
import UIKit

final class SearchBookViewController: UIViewController {
    
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
}

extension SearchBookViewController: SearchBookProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let searchContoller = UISearchController()
        
        //백그라운 어둡게
        searchContoller.obscuresBackgroundDuringPresentation = false
        searchContoller.searchBar.delegate = presenter
        
        navigationItem.searchController = searchContoller
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}
