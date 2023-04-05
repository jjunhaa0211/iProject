//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "")}
}
