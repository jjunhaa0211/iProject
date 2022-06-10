//
//  MyLogger.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

import Foundation
import Alamofire

final class  MyLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "ApiLog")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume")
        debugPrint(request)
    }
    func request(_ request: DownloadRequest, didParseResponse response: DownloadResponse<URL?, AFError>) {
    
        print("MyLogger - request.requestDidResume()")
        debugPrint(response)
        
    }
}
