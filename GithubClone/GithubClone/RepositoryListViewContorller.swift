//
//  RepositoryListViewContorller.swift
//  GithubClone
//
//  Created by 박준하 on 2022/09/15.
//

import UIKit
import RxSwift
import RxCocoa

final class RepositoryListViewContorller : UITableViewController {
    private let organization = "Apple"
    private let repositories = BehaviorSubject<[Repository]>(value: [])
    private let disposeBag = DisposeBag()
    
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
        DispatchQueue.global(qos: .background).async {[weak self] in
            guard let self = self else { return }
            self.fetchRepositories(of: self.organization)
        }
    }
    
    func fetchRepositories( of organization: String) {
        
        Observable.from([organization])
            .map { organization -> URL in
                return URL(string: "https://api.github.com/orgs/\(organization)/repos")!
            }
            .map { url -> URLRequest in
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                return request
            }
            .flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
                return URLSession.shared.rx.response(request: request)
            }
            .filter { responds, _ in
                return 200..<300 ~= responds.statusCode
            }
            .map { _, data -> [[String: Any]] in
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []),
                        let result = json as? [[String: Any]] else {
                    return []
                }
                return result
            }
            .filter { result in
                return result.count > 0
            }
            .map { objects in
                return objects.compactMap { dic -> Repository? in
                    guard let id = dic["id"] as? Int,
                          let name = dic["name"] as? String,
                          let description = dic["description"] as? String,
                          let srargazersCount = dic["stargazers_count"] as? Int,
                          let language = dic["language"] as? String else {
                        return nil
                    }
                    return Repository(id: id, name: name, description: description, stargazersCount: srargazersCount, language: language)
                }
            }
            .subscribe(onNext: { [weak self] newRepositories in
                self?.repositories.onNext(newRepositories)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.refreshControl?.endRefreshing()
                }
            })
            .disposed(by: disposeBag)
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
