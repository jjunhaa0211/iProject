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
