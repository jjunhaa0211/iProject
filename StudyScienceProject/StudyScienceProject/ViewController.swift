//
//  ViewController.swift
//  StudyScienceProject
//
//  Created by 박준하 on 2022/10/11.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        setupNavigationBar()
        setupTableView()
    }
    
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.dataSource = self
        
        $0.register(ViewControllCell.self, forCellReuseIdentifier: "ViewControllCell")
    }
    
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllCell", for: indexPath) as? ViewControllCell
        
        cell?.selectionStyle = .none
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
}

private extension ViewController {
    func setupNavigationBar() {
        navigationItem.title = "과학스타그램"
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
