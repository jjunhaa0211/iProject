//
//  BookReview.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/09.
//

import Foundation

struct BookReView: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
