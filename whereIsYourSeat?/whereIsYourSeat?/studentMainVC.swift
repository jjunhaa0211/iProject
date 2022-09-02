//
//  studentMainViewController.swift
//  where is your seat?
//
//  Created by 박준하 on 2022/07/02.
//

import UIKit

class studentMainVC: BassVC {

//sell View
//---------------------------------------------
    
    @IBOutlet weak var sell11: UIView!
    @IBOutlet weak var sell21: UIView!
    @IBOutlet weak var sell31: UIView!
    @IBOutlet weak var sell41: UIView!
    
    @IBOutlet weak var sell12: UIView!
    @IBOutlet weak var sell22: UIView!
    @IBOutlet weak var sell32: UIView!
    @IBOutlet weak var sell42: UIView!
    
    @IBOutlet weak var sell13: UIView!
    @IBOutlet weak var sell23: UIView!
    @IBOutlet weak var sell33: UIView!
    @IBOutlet weak var sell43: UIView!
    
    @IBOutlet weak var sell14: UIView!
    @IBOutlet weak var sell24: UIView!
    @IBOutlet weak var sell34: UIView!
    @IBOutlet weak var sell44: UIView!
    
    @IBOutlet weak var sell15: UIView!
    @IBOutlet weak var sell25: UIView!
    @IBOutlet weak var sell35: UIView!
    @IBOutlet weak var sell45: UIView!
    
    @IBOutlet weak var sell16: UIView!
    @IBOutlet weak var sell26: UIView!
    @IBOutlet weak var sell36: UIView!
    @IBOutlet weak var sell46: UIView!
//---------------------------------------------
//lable
    @IBOutlet weak var Label11: UILabel?
    @IBOutlet weak var Label12: UILabel?
    @IBOutlet weak var Label13: UILabel?
    @IBOutlet weak var Label14: UILabel?
    
    @IBOutlet weak var Label21: UILabel?
    @IBOutlet weak var Label22: UILabel?
    @IBOutlet weak var Label23: UILabel?
    @IBOutlet weak var Label24: UILabel?
    
    @IBOutlet weak var Label31: UILabel?
    @IBOutlet weak var Label32: UILabel?
    @IBOutlet weak var Label33: UILabel?
    @IBOutlet weak var Label34: UILabel?
        
    @IBOutlet weak var Label41: UILabel?
    @IBOutlet weak var Label42: UILabel?
    @IBOutlet weak var Label43: UILabel?
    @IBOutlet weak var Label44: UILabel?
    
    @IBOutlet weak var Label51: UILabel?
    @IBOutlet weak var Label52: UILabel?
    @IBOutlet weak var Label53: UILabel?
    @IBOutlet weak var Label54: UILabel?
    
    @IBOutlet weak var Label61: UILabel?
    @IBOutlet weak var Label62: UILabel?
    @IBOutlet weak var Label63: UILabel?
    @IBOutlet weak var Label64: UILabel?
    
    
//button View
//---------------------------------------------
    
    @IBOutlet weak var changePlace: UIButton!
    @IBOutlet weak var schedule: UIButton!
    @IBOutlet weak var swapAAndB: UIButton!
    
//---------------------------------------------
    
    var vcTitle : String = "" {
        didSet{
            self.title = vcTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changePlace.layer.cornerRadius = CGFloat(19)
        schedule.layer.cornerRadius = CGFloat(19)
        swapAAndB.layer.cornerRadius = CGFloat(19)
    }
    
    @IBAction func changePlaceButton(_ sender: Any) {
        
        let checkAgainAction = UIAlertController(title: "개발자에게 GRANT를 받으세요", message: "당신은 권한이 없습니다", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
    }
    
    @IBAction func scheduleButton(_ sender: Any) {
        
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        print(str)
        
        
        //요일 넣기
        if(str == "월"){
        let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 창체 \n2교시 : 영어\n3교시 : 수학 \n4교시 : 과학 \n5교시 : 프밍 \n6교시 : 체육 \n7교시 : 사회", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }
        if(str == "화"){
        let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 프밍 \n2교시 : 음악\n3교시 : 사회 \n4교시 : 국어 \n5교시 : 과학 \n6교시 : 체육\n7교시 : 컴구", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }
        if(str == "수"){
        let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 영어 \n2교시 : 수학\n3교시 : 컴구 \n4교시 : 컴구 \n5교시 : 프밍 \n6교시 : 음악\n7교시 : 사회", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }
        if(str == "목"){
        let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 컴구 \n2교시 : 프밍\n3교시 : 프밍 \n4교시 : 영어 \n5교시 : 수학 \n6교시 : 창체\n7교시 : 창체", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }
        if(str == "금"){
        let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 프밍 \n2교시 : 프밍\n3교시 : 과학 \n4교시 : 국어 \n5교시 : 음악\n집으로 가세요!!", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }else {
            let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 코딩 \n2교시 : 코딩\n3교시 : 코딩 \n4교시 : 코딩 \n5교시 : 코딩\n깃허브 하세요!!", preferredStyle: .alert)
                checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(checkAgainAction, animated: true, completion: nil)
        }
    };
    @IBAction func iceButton(_ sender: Any) {
        
        let checkAgainAction = UIAlertController(title: "선생님에게 전송완료", message: "허가가 떨어질때까지 참으세요", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        }
    @IBAction func hotButton(_ sender: Any) {
        
        let checkAgainAction = UIAlertController(title: "학생이 덥습니다", message: "자리 바꿈을 요청했습니다", preferredStyle: .alert)
            checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(checkAgainAction, animated: true, completion: nil)
        
    }
}

