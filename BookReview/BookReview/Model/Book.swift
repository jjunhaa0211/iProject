//
//  Book.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/09.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "")}
}
