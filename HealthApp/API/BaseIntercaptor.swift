//
//  BaseIntercaptor.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

import Foundation
import Alamofire

class BaseIntercaptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var request = urlRequest
        
        //json 형태로만 받겠다
        request.addValue( "application/json; charset=UTF-8", forHTTPHeaderField: "Con tent-Type")
        request.addValue( "application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        //공통 파라매터 추가
        
        var dictionary = [String : String]()
        
        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")
        
        do {
             
            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)

        }catch{
            print(error)
        }
        
        completion(.success(urlRequest))
        
        
        
        
    }
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        completion(.doNotRetry)
    }
}
