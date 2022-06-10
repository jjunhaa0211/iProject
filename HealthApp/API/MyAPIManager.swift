//
//  MyAPIManager.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

import Foundation
import Alamofire

final class MyAPIManager {
    
    //싱글턴 적용
    static let shared = MyAPIManager()
    
    //인터셉터
    let interceptors = Interceptor(interceptors:
                                [
                                    BaseIntercaptor()
                                ])
    
    //로거 설정
    let monitors = [MyLogger() ,MyApiStatusLogger()] as [EventMonitor]
    
    //세션 설정
    var session : Session
    
    private init() {
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors)
    }
}
