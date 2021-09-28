//
//  SecondStage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct LaunchSecondStage : Codable {
    
    let block : Int?
    let payloads : [LaunchPayload]?
    
    enum CodingKeys: String, CodingKey {
        case block = "block"
        case payloads = "payloads"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        block = try values.decodeIfPresent(Int.self, forKey: .block)
        payloads = try values.decodeIfPresent([LaunchPayload].self, forKey: .payloads)
    }
}
