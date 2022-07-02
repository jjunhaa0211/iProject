//
//  RTC.swift
//  where is your seat?
//
//  Created by 박준하 on 2022/07/02.
//

import UIKit

class RTC : BassVC {
    var vcTitle : String = "" {
        didSet{
            self.title = vcTitle
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
