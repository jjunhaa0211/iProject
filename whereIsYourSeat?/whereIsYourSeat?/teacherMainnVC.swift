//
//  ViewController.swift
//  where is your seat?
//
//  Created by 박준하 on 2022/06/30.
//

import UIKit

class teacherMainVC: BassVC {

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
    @IBOutlet weak var saveButton: UIButton!
    
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
        saveButton.layer.cornerRadius = CGFloat(10)
        
    }
    
    @IBAction func changePlaceButton(_ sender: Any) {
        
        var totalCount = 18
        var ranArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
        
        let Lalels = [Label11,Label12,Label13,Label14,
                          Label21,Label22,Label23,Label24,
                          Label31,Label32,Label33,Label34,
                          Label41,Label42,Label43,Label44,
                          Label51,Label52,Label53,Label54,
                          Label61,Label62,Label63,Label64]
            
        var i = 0
        while(totalCount >= 1) {
            
            let randomIndex = Int(arc4random_uniform(UInt32(ranArray.count)))
            print(ranArray[randomIndex])

            Lalels[i]?.text = String(ranArray[randomIndex])
            
            ranArray.remove(at: randomIndex)
        
            i = i + 1
            totalCount = totalCount - 1
            
            //2반은 12번은 없다
            
//            Label12?.text = String(ranArray[randomIndex])
//            Label13?.text = String(ranArray[randomIndex])
//            Label14?.text = String(ranArray[randomIndex])
//            Label21?.text = String(ranArray[randomIndex])
//            Label22?.text = String(ranArray[randomIndex])
//            Label23?.text = String(ranArray[randomIndex])
//            Label24?.text = String(ranArray[randomIndex])
//            Label31?.text = String(ranArray[randomIndex])
//            Label32?.text = String(ranArray[randomIndex])
//            Label33?.text = String(ranArray[randomIndex])
//            Label34?.text = String(ranArray[randomIndex])
//            Label41?.text = String(ranArray[randomIndex])
//            Label42?.text = String(ranArray[randomIndex])
//            Label43?.text = String(ranArray[randomIndex])
//            Label44?.text = String(ranArray[randomIndex])
//            Label51?.text = String(ranArray[randomIndex])
//            Label52?.text = String(ranArray[randomIndex])
//            Label53?.text = String(ranArray[randomIndex])
//            Label54?.text = String(ranArray[randomIndex])
//            Label61?.text = String(ranArray[randomIndex])
//            Label62?.text = String(ranArray[randomIndex])
//            Label63?.text = String(ranArray[randomIndex])
//            Label64?.text = String(ranArray[randomIndex])
        }
        
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
        } else {
            let checkAgainAction = UIAlertController(title: "시간표", message: "1교시 : 코딩 \n2교시 : 코딩\n3교시 : 코딩 \n4교시 : 코딩 \n5교시 : 코딩\n깃허브 하세요!!", preferredStyle: .alert)
                checkAgainAction.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(checkAgainAction, animated: true, completion: nil)
        }
    };
    
    @IBAction func checkSaveButton(_ sender: Any) {
        print("값이 정상적으로 저장되었습니다")
    }
}

