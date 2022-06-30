//
//  loginBar.swift
//  whereIsYourSeat?
//
//  Created by 박준하 on 2022/06/30.
//

import UIKit
import Toast_Swift


class loginVC: BassVC, UISearchBarDelegate,UIGestureRecognizerDelegate{
    
    
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchIdicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var KeyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: loginVC.self, action: nil)
    //Make - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodVC - viewDidLoad called")
        //UI설정
        self.config()
    }
    
    
    //화면이 넘어가기 전 준비 과정(prepare == 준비하다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier) {
        case SEGUE_ID.STUDENT_VC:
            
            let nextVC = segue.destination as! studentVC
            
            guard let calendarInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = calendarInputValue
            
        case SEGUE_ID.TEACHER_VC:
            
            let nextVC = segue.destination as! teacherVC
            
            guard let exerciseInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = exerciseInputValue
            
            
        default:
            print("default")
        }
    }
    
    fileprivate func config(){
        
        //UI 설정
        self.searchButton.layer.cornerRadius = 10
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        //키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    //Make - fileprivate
    fileprivate func pushVC(){
        
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
            
        case 0:
            print("학생 페이지 이동")
            segueId = "goToststudentVC"
            
        case 1:
            print("선생님 페이지 이동")
            segueId = "goToExerciseInformationVC"
        default:
            print("default")
            segueId = "goToteacherVC"
        }
        
        //화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        //키보드 사이즈 가져오기
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if(keyboardSize.height < searchButton.frame.origin.y) {
                print("키버드가 버튼을 덮었다.")
                
                let distance = keyboardSize.height - searchButton.frame.origin.y
                self.view.frame.origin.y = distance + searchButton.frame.height
            }
            
        }
        self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillHide(){
        
        self.view.frame.origin.y = 0
    }
    
    //Make - IBAction
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        
        guard let userInput = self.searchBar.text else { return }
    }
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        
        var searchBerTitle = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchBerTitle = "자리배치를 보고 시간표 확인이 가능합니다"
            
        case 1:
            searchBerTitle = "자리를 수정하고 학생의 자리 배치를 바꿀 수 있습니다"
            
        default:
            searchBerTitle = "자리를 수정하고 학생의 자리 배치를 바꿀 수 있습니다"
        }
        
        self.searchBar.placeholder = searchBerTitle
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
            self.searchButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
        } else {
            self.searchButton.isHidden = false
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
    
}
