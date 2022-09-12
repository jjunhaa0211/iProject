//
//  ViewController.swift
//  SubwayStation
//
//  Created by 박준하 on 2022/09/09.
//

import Alamofire
import SnapKit
import UIKit

class StationSearchViewController: UIViewController {
    
    private var numberOfCell: Int = 0
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableViewLayout()
    }
    
    private func setNavigationItems() {
        //searchbar 위에 큰 타이틀
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        //searchbar 안에 문구
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요"
        //true가 되면 주변이 흐릿해진다
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
    }

    private func setTableViewLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func requestStationName(from stationName: String) {
        let urlString = "http://openAPI.seoul.go.kr:8088/sample/json/SearchInfoBySubwayNameService/1/5/\(stationName)"
        
        //addingPercentEncoding url에 한국어를 사용할려면 깨지지 않도록 설정하는 것
        AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: StationResponseModel.self) { response in
            guard case .success(let data) = response.result else { return }
            print(data.stations)
        }
        .resume()
    }
}

extension StationSearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        numberOfCell = 10
        tableView.reloadData()
        tableView.isHidden = false
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        numberOfCell = 0
        tableView.isHidden = true
    }
    
    //searchbar 글자 감지
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        requestStationName(from: searchText)
        print(searchText)
    }
}

extension StationSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StationSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        
        return cell
    }
}
