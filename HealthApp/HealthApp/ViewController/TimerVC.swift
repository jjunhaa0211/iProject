//
//  TimerVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/02.
//

import UIKit

class TimerVC: UIViewController {
    
    
    @IBOutlet var timerLable: UILabel!
    //---------------------------------

    @IBOutlet var startButton: UIButton!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    //---------------------------------
    
    @IBOutlet var addOne: UIButton!
    @IBOutlet var addThirty: UIButton!
    @IBOutlet var addTen: UIButton!
    @IBOutlet var addFive: UIButton!
    //----------------------------------
    
    var timer = Timer()
    var seconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TimerVC - viewDidLoad() called")
    }
    @objc func timerClass() {
        seconds -= 1
        timerLable.text = String(seconds)
        if(seconds == 0){
            timer.invalidate()//invalidate == 무효화
        }
    }
    @IBAction func startButton(_ sender: Any) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerVC.timerClass), userInfo: nil, repeats: true)
    }
    @IBAction func checkButton(_ sender: Any) {
        //보류 추후 만들 예정
    }
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        timerLable.text = String(seconds)
    }
    @IBAction func addOne(_ sender: Any) {
        seconds = seconds + 60
        timerLable.text = String(seconds)
    }
    @IBAction func addThirty(_ sender: Any) {
        seconds = seconds + 30
        timerLable.text = String(seconds)
    }
    @IBAction func addTen(_ sender: Any) {
        seconds = seconds + 10
        timerLable.text = String(seconds)
    }
    @IBAction func addFive(_ sender: Any) {
        seconds = seconds + 5
        timerLable.text = String(seconds)
    }
}
