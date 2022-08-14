//
//  BeerListViewController.swift
//  Berwery
//
//  Created by 박준하 on 2022/08/14.
//

import UIKit

class BeerListViewController : UITableViewController {
    
    var beerList = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UINavigationBar
        title = "ㅈㅎ브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
}

//UITableView, DataSource, Delegate
extension BeerListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
}
