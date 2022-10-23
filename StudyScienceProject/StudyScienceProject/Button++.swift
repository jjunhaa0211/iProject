//
//  Button++.swift
//  StudyScienceProject
//
//  Created by 박준하 on 2022/10/11.
//

import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}

