//
//  File.swift
//  SearchBlog
//
//  Created by 박준하 on 2022/11/21.
//

import UIKit

protocol AlertActionConverible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
