//
//  BassVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/03.
//

import UIKit
import Toast_Swift

class BassVC : UIViewController {
var vcTitle : String = "" {
    didSet{
        
        self.title = vcTitle
        
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//         super.viewWillAppear(animated)
//        //인증실패 노티피케이션 등록
//        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
//    }
//    override func viewWillDisapper(_ animated: Bool) {
//         super.viewWillDisapper(animated)
//        //인증실패 노티피케이션 해제
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
//    }
    
    @objc func showErrorPopup(notification: NSNotification){
        
        if let date = notification.userInfo?["statusCode"] {
            print("showErrorPopup() - data : \(date)")
            DispatchQueue.main.async {
                self.view.makeToast("에러다ㅜ 도망ㅇ쳐", duration: 1.0, position: .center)
            }
        }
    }
}
