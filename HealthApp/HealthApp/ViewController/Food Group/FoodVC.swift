//
//  FoodVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/02.
//

import UIKit
import Toast_Swift
import SwiftUI

class FoodVC: UIViewController,UISearchBarDelegate,UIGestureRecognizerDelegate{

    //Make - IBOutlet
    @IBOutlet var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var searchIdicator: UIActivityIndicatorView!
    
    @IBOutlet var seachButton: UIButton!
    
    var KeyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: FoodVC.self, action: nil)
//---------------------------------
    
    //Make - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodVC - viewDidLoad called")
        //UI 설정
        self.config()
    }
    
    //화면이 넘어가기 전 준비 과정(prepare == 준비하다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier) {
        case SEGUE_ID.USER_CALORIE_VC:
            
            let nextVC = segue.destination as! UserCalorieVC
            
            guard let calendarInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = calendarInputValue
            
        case SEGUE_ID.ESERCISE_INFORMATION_VC:
            
            let nextVC = segue.destination as! ExerciseInformationVC
            
            guard let exerciseInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = exerciseInputValue
            
            
        default:
            print("default")
        }
    }
    
    fileprivate func config(){
        
        //UI 설정
        self.seachButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        
        self.searchBar.delegate = self
        
        self.KeyboardDismissTabGesture.delegate = self
        
        self.view.addGestureRecognizer(KeyboardDismissTabGesture)
        
        self.searchBar.becomeFirstResponder() //포커싱 주기
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //키보드가 올라가는 이벤트
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
    }
    //Make - fileprivate
    fileprivate func pushVC(){
        
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
            
        case 0:
            print("칼로리 화면 이동")
            segueId = "goToUserCalorieVC"
            
        case 1:
            print("운동 화면 이동")
            segueId = "goToExerciseInformationVC"
        default:
            print("default")
            segueId = "goToUserCalorieVC"
        }
        
        //화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        
    }
    
    @objc func keyboardWillHide(){
        
    }
    
    //Make - IBAction
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        //화면 이동
        pushVC()
    }
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        
        var searchBerTitle = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchBerTitle = "음식 칼로리"
            
        case 1:
            searchBerTitle = "운동 검색"
            
        default:
            searchBerTitle = "운동 검색"
        }
        
        self.searchBar.placeholder = searchBerTitle + " 입력"
        //포커싱 주기
        self.searchBar.becomeFirstResponder()
        //포커싱 빼기
        //self.seachButton.resignFirstResponder()
    }
    //아무 것도 적지 않으면 오류가 뜸
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let userInputString = searchBar.text else { return }
        
        if(userInputString.isEmpty) {
            // toast with a specific duration and position
            self.view.makeToast("검색 키워드를 입력해주세요", duration: 1.0, position: .center)
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        //searchBar에 값을 입력했을 때 검색이 표시됨
        if(searchText.isEmpty){
            self.seachButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
        } else {
            self.seachButton.isHidden = false
        }
    }
    //입력 제안 집어 넣기
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextIn : \(searchBar.text?.appending(text).count ?? 0)")
        
        if(inputTextCount >= 12){
            // toast with a specific duration and position
            self.view.makeToast("12자까지만 입력 가능합니다", duration: 1.0, position: .center)
    }
        if(inputTextCount <= 12) {
            return true
        } else {
            return false
        }
        
//        return inputTextCount <= 12
        
    }
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive shouldReceivetouch: UITouch) -> Bool{
//
//        if(touch.view?.isDescendant(of: searchFilterSegment) == true){
//            print("세그먼트가 터치되었다.")
//            return false
//        } else if(UITouch.view?.isDescendant(of: searchFilterSegment) == true) {
//            print("서취바가 터치되었다.")
//            return false
//        } else {
//            view.endEditing(true)
//            print("화면이 터치되었다.")
//            return true
//        }
//    }
}
