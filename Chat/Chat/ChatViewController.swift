//
//  ChatViewController.swift
//  Chat
//
//  Created by 박준하 on 2022/09/06.
//

import UIKit
import SnapKit
import Charts

final class CharViewController : UIViewController {
    
    var months: [String]!
    var unitsSold: [Double]!
    
    let chartView = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chartView)
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            
        chartView.noDataText = "데이터가 없습니다!!🥸"
        chartView.noDataFont = .systemFont(ofSize: 20)
        chartView.noDataTextColor = .lightGray
        
        chartView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
    
}
