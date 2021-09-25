//
//  Mass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Mass : Codable {
    
    let kg : Int?
    let lb : Int?
    
    enum CodingKeys: String, CodingKey {
        case kg = "kg"
        case lb = "lb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kg = try values.decodeIfPresent(Int.self, forKey: .kg)
        lb = try values.decodeIfPresent(Int.self, forKey: .lb)
    }
    
}
