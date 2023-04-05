//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

struct BookSearchRequestModel: Codable {
    /// 검색 책 키워드
    let query: String
}
