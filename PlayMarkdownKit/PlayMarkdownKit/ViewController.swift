//
//  ViewController.swift
//  PlayMarkdownKit
//
//  Created by 박준하 on 2023/01/17.
//

import UIKit
import MarkdownKit
import Then
import SnapKit
import SwiftyMarkdown

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        print("\(md)")
    }
    
    let md = SwiftyMarkdown(string: "# Heading\nMy *Markdown* string").attributedString()

    
    let label = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "dkdkdk"
    }
    
    print()

}

