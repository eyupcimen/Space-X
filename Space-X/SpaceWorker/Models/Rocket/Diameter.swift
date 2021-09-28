//
//  Diameter.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Diameter : Codable {
    
    let feet : Double?
    let meters : Double?
    
    enum CodingKeys: String, CodingKey {
        case feet = "feet"
        case meters = "meters"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feet = try values.decodeIfPresent(Double.self, forKey: .feet)
        meters = try values.decodeIfPresent(Double.self, forKey: .meters)
    }
    
}
