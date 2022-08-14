//
//  BeerListViewController.swift
//  Berwery
//
//  Created by 박준하 on 2022/08/14.
//

import UIKit

class BeerListViewController : UITableViewController {
    
    var beerList = [Beer]()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UINavigationBar 성정
        title = "ㅈㅎ브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //UITableView 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell") // cell이를 설정과 가질 값
        tableView.rowHeight = 150
    }
    
}

//UITableView, DataSource, Delegate
extension BeerListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else { return UITableViewCell() }
                
        let beer = beerList[indexPath.row]
        cell.configure(whih: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        
        self.show(detailViewController, sender: nil)
    }
}


//data Fatching
private extension BeerListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
    }
}
