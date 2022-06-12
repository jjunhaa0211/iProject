//
//  MysearchRouter.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

import Foundation
import Alamofire
import SwiftUI


//검생관련 API
enum MysearchRouter : URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("MysearchRouter - asURLRequest() url : \(url)")
        
        var request = URLRequest(url: url)
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode( parmeters, into: request)
        
        
        return request
    }
    
    case searchPhotos(term : String)
    case searchUsers(term : String)
    
    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }
    
    
    var method: HTTPMethod {
        
        switch self {
        case .searchPhotos, .searchUsers:
            return .get
        }
        
//        switch self {
//        case .searchPhotos:
//            return .get
//        case .searchUsers:
//            return .post
//        }
    }
    
    var endPoint : String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    var parmeters : [String : String] {
        
//        switch self {
//        case let .searchUsers(term):
//            return ["query1" : term + ""]
//        case let .searchPhotos(term):
//            return ["query2" : term ]
//    }
        switch self {
        case let .searchUsers(term), let .searchPhotos(term):
            return ["query" : term ]
        }
    }
}
