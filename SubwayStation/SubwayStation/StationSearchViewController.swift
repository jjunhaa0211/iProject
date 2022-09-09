//
//  ViewController.swift
//  SubwayStation
//
//  Created by 박준하 on 2022/09/09.
//

import SnapKit
import UIKit

class StationSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //searchbar 위에 큰 타이틀
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        
        //searchbar 안에 문구
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요"
        searchController.obscuresBackgroundDuringPresentation = false //임시
        
        navigationItem.searchController = searchController
    }

}
