//
//  loginBar.swift
//  whereIsYourSeat?
//
//  Created by 박준하 on 2022/06/30.
//

import UIKit
import Toast_Swift


class textVC: BassVC, UISearchBarDelegate,UIGestureRecognizerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet weak var textLoign: UITextField!
    
    @IBOutlet weak var searchIdicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var KeyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: textVC.self, action: nil)
    //Make - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodVC - viewDidLoad called")
        //UI설정
        searchButton.layer.cornerRadius = CGFloat(10)
        
        self.textLoign.delegate = self
    }
        
    //화면이 넘어가기 전 준비 과정(prepare == 준비하다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier) {
        case segueId.STUDENT_VC:
            
            let nextVC = segue.destination as! studentMainVC
            guard let calendarInputValue = self.textLoign.text else { return }
            
            nextVC.vcTitle = calendarInputValue
            
        case segueId.TEACHER_VC:
            
            let nextVC = segue.destination as! teacherMainVC
            
            guard let exerciseInputValue = self.textLoign.text else { return }
            
            nextVC.vcTitle = exerciseInputValue
            
            
        default:
            print("default")
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        //키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    //Make - fileprivate
    fileprivate func pushVC(){
        
        var segue : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
            
        case 0:
            print("학생 페이지 이동")
            segue = "goToststudentVC"
            
        case 1:
            print("선생님 페이지 이동")
            segue = "goToteacherVC"
        default:
            print("default")
            segue = "goToteacherVC"
        }
        
        //화면 이동
        self.performSegue(withIdentifier: segue, sender: self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        //키보드 사이즈 가져오기
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if(keyboardSize.height < searchButton.frame.origin.y) {
                print("키보드가 버튼을 덮었다.")
                
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
    //버튼을 클릭했을때 세그로 이동
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        
        if(textLoign.text == "") {
            let checkAgainAction = UIAlertController(title: "이름을 입력하세요", message: "당신의 이름이 nil입니다", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        } else {
        
        var segue : String = ""
//            if(textLoign.text != nil) {
//                let checkAgainAction = UIAlertController(title: "환영합니다", message: "누구님", preferredStyle: .alert)
//                checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
//                self.present(checkAgainAction, animated: true, completion: nil)
        switch searchFilterSegment.selectedSegmentIndex {

        case 0:
            print("학생 화면으로 이동")
            segue = "goToststudentVC"
        case 1:
            if(textLoign.text == "정은진" || textLoign.text == "오상진") {
                print("선생님 화면으로 이동")
                segue = "goToteacherVC"
            } else if(textLoign.text != "정은진" || textLoign.text == "오상진") {
                let checkAgainAction = UIAlertController(title: "당신에게는 권한이 없습니다", message: "이름을 다시 확인해주세요", preferredStyle: .alert)
                checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(checkAgainAction, animated: true, completion: nil)
                segue = "goToteacherVC"
            }
            
        default:
            print("default")
            segue = "goToteacherVC"
            
        }
        self.performSegue(withIdentifier: segue, sender: self)
        }
}
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        
        var textLoign = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            textLoign = "자리배치를 보고 시간표 확인이 가능합니다"
            
        case 1:
            textLoign = "자리를 수정하고 학생의 자리 배치를 바꿀 수 있습니다"
            
        default:
            textLoign = "자리를 수정하고 학생의 자리 배치를 바꿀 수 있습니다"
        }
        
        self.textLoign.placeholder = textLoign
        //포커싱 주기
        self.textLoign.becomeFirstResponder()
        //포커싱 빼기
        //self.seachButton.resignFirstResponder()
    }
    //아무 것도 적지 않으면 오류가 뜸
    private func searchBarSearchButtonClicked(_ textField: UITextField) {
        
        guard let userInputString = textField.text else { return }
        
        if(userInputString.isEmpty) {
            // toast with a specific duration and position
            self.view.makeToast("검색 키워드를 입력해주세요", duration: 1.0, position: .center)
        } else {
            pushVC()
            textField.resignFirstResponder()
        }
    }
}
