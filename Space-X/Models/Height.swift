//
//  Height.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Height : Codable {
    
    let feet : Int?
    let meters : Int?
    
    enum CodingKeys: String, CodingKey {
        case feet = "feet"
        case meters = "meters"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feet = try values.decodeIfPresent(Int.self, forKey: .feet)
        meters = try values.decodeIfPresent(Int.self, forKey: .meters)
    }
    
}
