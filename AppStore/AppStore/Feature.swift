//
//  Feature.swift
//  AppStore
//
//  Created by 박준하 on 2022/09/08.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName : String
    let description: String
    let imageURL: String
}
