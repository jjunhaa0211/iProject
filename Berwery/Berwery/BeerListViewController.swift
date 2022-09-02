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
        
        fetchBeer(of: currentPage)
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
        detailViewController.beer = selectedBeer
        self.show(detailViewController, sender: nil)
    }
}


//data Fatching
private extension BeerListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "http://44.209.75.36:8080/todos/list?todoYearMonth=2022-08") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else {
                print("ERROR: URLSession data task \(error?.localizedDescription ?? "")")
                return
            }
            switch response.statusCode {
            case(200...299):
                self.beerList += beers
                self.currentPage += 1
                
                debugPrint(response)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case(400...499):
                print("""
                      ERROR: 클라이언트 error \(response.statusCode)
                      Response: \(response)
                      """)
            case(500...599):
                print("""
                      ERROR: sever error \(response.statusCode)
                      Response: \(response)
                      """)
            default:
                print("""
                      ERROR: error \(response.statusCode)
                      Response: \(response)
                      """)
            }
        }
        dataTask.resume()
    }
}
