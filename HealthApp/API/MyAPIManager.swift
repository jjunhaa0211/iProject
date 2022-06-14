//
//  MyAPIManager.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/10.
//

//import Foundation
//import Alamofire
//
////API문제로 현제 401 에러가 뜬다 이봐 개발자 빨리 고쳐라
//
//final class MyAPIManager {
//    
//    //싱글턴 적용
//    static let shared = MyAPIManager()
//
//    //인터셉터
//    let interceptors = Interceptor(interceptors:
//                                [
//                                    BaseIntercaptor()
//                                ])
//
//    //로거 설정
//    let monitors = [MyLogger() ,MyApiStatusLogger()] as [EventMonitor]
//
//    //세션 설정
//    var session : Session
//
//    private init() {
//        session = Session(
//            interceptor: interceptors,
//            eventMonitors: monitors)
//    }
//}
