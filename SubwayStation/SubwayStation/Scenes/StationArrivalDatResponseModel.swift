//
//  StationArrivalDatResponseModel.swift
//  SubwayStation
//
//  Created by 박준하 on 2022/09/12.
//

import Foundation

struct StationArrivalDatResponseModel: Decodable {
    var realtimeArrivalList: [RealTimeArrival] = [] 
    
    struct RealTimeArrival: Decodable {
        let line: String
        let remainTime: String
        let currentStation: String
        
        enum CodingKeys: String, CodingKey {
            case line = "trainLineNm"
            case remainTime = "arvlMsg2"
            case currentStation = "arvlMsg3"
        }
    }
}
