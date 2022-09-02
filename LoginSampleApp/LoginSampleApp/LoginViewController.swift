//
//  LoginViewController.swift
//  LoginSampleApp
//
//  Created by 박준하 on 2022/09/01.
//

import UIKit

class LoginViewController : UIViewController {
    @IBOutlet var emailLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var appleLoginButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //nvigation 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    @IBAction func googleLoginTapped(_ sender: Any) {
        //아직
    }
    @IBAction func appleLoginTapped(_ sender: Any) {
        //아직
    }
}
