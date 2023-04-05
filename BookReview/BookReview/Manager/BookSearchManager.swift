//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/05.
//

import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        
        //GQ_IF_vnrbWbs9_zyczW
        //Vg5pMvL_2W
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "GQ_IF_vnrbWbs9_zyczW",
            "X-Naver-Client-Secret": "Vg5pMvL_2W"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
