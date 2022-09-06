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
        
        //data가 없을 경우를 적기
        chartView.noDataText = "데이터가 없습니다!!🥸"
        chartView.noDataFont = .systemFont(ofSize: 20)
        chartView.noDataTextColor = .lightGray
        
        //모든 view를 0으로 바짝 붙이기
        chartView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        //data 받아오기
        setChart(dataPoints: months, values: unitsSold)
    }
}

private extension CharViewController {
    
    //
    func setChart(dataPoints : [String], values : [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        //data 개수 만큼 가져고기 for문을 돌린다
        for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        //판매량 추가
        let chartDateSet = BarChartDataSet(entries: dataEntries, label: "판매량")
        
        //bar 색깔 바꾸기
        chartDateSet.colors = [.systemBlue]
        
        //data 추가하기
        let chartDate = BarChartData(dataSet: chartDateSet)
        chartView.data = chartDate
        
        //선택불가능하게 만들게
        chartDateSet.highlightEnabled = false
        //줌 불가능하게 만들기
        chartView.doubleTapToZoomEnabled = false
        
        //설명 위치
        chartView.xAxis.labelPosition = .bottom
        
        //라벨의 위치
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴
        chartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        //오른쪽 레이블제거
        chartView.rightAxis.enabled = false
        
        //그래프 올라오는 애니메이션
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        //그래프 애니매이션
//        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInCirc)
    }
}
