//
//  CityCovidOverview.swift
//  COVID19
//
//  Created by 박준하 on 2022/08/11.
//

import Foundation

struct CityCovidOverview: Codable {
    let korea : CovidoverView
    let seoul : CovidoverView
    let busan : CovidoverView
    let daegu : CovidoverView
    let incheon : CovidoverView
    let gwangju : CovidoverView
    let daejeon : CovidoverView
    let ulsan : CovidoverView
    let sejong : CovidoverView
    let gyeonggi : CovidoverView
    let gangwon : CovidoverView
    let chungbuk : CovidoverView
    let chungnam : CovidoverView
    let jeonbuk : CovidoverView
    let jeonnam : CovidoverView
    let gyeongbuk : CovidoverView
    let gyeongnam : CovidoverView
    let jeju : CovidoverView
}

struct CovidoverView: Codable {
    let countryName : String
    let newCase : String
    let totalCase : String
    let recovered : String
    let death : String
    let percentage : String
    let newCcase : String
    let newFcase : String
}
