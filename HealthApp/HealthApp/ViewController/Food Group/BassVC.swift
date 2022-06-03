//
//  BassVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/03.
//

import UIKit

class BassVC : UIViewController {
var vcTitle : String = "" {
    didSet{
        
        self.title = vcTitle
        
        }
    }
}
