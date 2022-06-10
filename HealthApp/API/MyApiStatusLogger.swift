//
//  MyApiStatusLogger.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "ApiLog")
    
    func requestDidResume(_ request: Request) {
        print("MyApiStatusLogger - rquestDidRename()")
        debugPrint(request)
    }
    func request(_ request: DownloadRequest, didParseResponse response: DownloadResponse<URL?, AFError>) {
    
        guard let ststusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - ststusCode : \(ststusCode)")
        debugPrint(response)
        
    }
}
