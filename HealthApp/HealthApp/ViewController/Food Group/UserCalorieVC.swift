//
//  UserCalorieVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/02.
//

import UIKit

class UserCalorieVC: BassVC {

    var vcTitle : String = "" {
        didSet{
            
            self.title = vcTitle
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UsercalorieVC - viewDidLoad called")
    }


}
