//
//  CalendarVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/02.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet var calendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CalendarVC - viewDidLoad called")
        //배경색
        calendarView.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        //날짜 변경 색
        calendarView.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        //오늘 날짜색
        calendarView.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        //여러개 선택하기
        calendarView.allowsMultipleSelection = true
        //꾹 눌러서 다중 선택
        calendarView.swipeToChooseGesture.isEnabled = true
        //세로로 바꾸기
        calendarView.scrollDirection = .vertical
        // 선택된 날짜의 모서리 설정 ( 0으로 하면 사각형으로 표시 )
        //calendarView.appearance.borderRadius = 0
        dateFormatter.dateFormat = "yyyy-MM-dd"
        calendarView.delegate = self
        calendarView.dataSource = self
    }
}
let dateFormatter = DateFormatter()
extension HomeVC : FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 선택됨")
    }
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 해제됨")
    }
}
