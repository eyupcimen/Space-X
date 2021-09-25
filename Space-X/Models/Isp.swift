//
//  Isp.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Isp : Codable {
    
    let seaLevel : Int?
    let vacuum : Int?
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum = "vacuum"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        seaLevel = try values.decodeIfPresent(Int.self, forKey: .seaLevel)
        vacuum = try values.decodeIfPresent(Int.self, forKey: .vacuum)
    }
    
}
