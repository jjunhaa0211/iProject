//
//  RepositoryListViewContorller.swift
//  GithubClone
//
//  Created by 박준하 on 2022/09/15.
//

import UIKit

final class RepositoryListViewContorller : UITableViewController {
    private let organization = "Apple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = organization + "Repositoris"
        
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl
        refreshControl?.backgroundColor = .white
        refreshControl?.tintColor = .darkGray
        //표현되는 글자
        refreshControl?.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.register(RepositoryListCell.self, forCellReuseIdentifier: "RepositoryListCell")
        tableView.rowHeight = 140
    }
    
    @objc func refresh() {
        
    }
}

//UITableViewdataSource Delegate
extension RepositoryListViewContorller{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryListCell", for: indexPath) as? RepositoryListCell else { return UITableViewCell() }
        
        return cell
    }
}
