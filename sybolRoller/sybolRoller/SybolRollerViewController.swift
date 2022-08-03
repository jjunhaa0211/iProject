//
//  SybolRollerViewController.swift
//  sybolRoller
//
//  Created by 박준하 on 2022/08/03.
//

import UIKit

class SybolRollerViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    let sybols : [String] = ["sun.min","moon","cloud","wind","snowflake"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(systemName: "cloud")
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("와 눌렸다...")
    }
}
