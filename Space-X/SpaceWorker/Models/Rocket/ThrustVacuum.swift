//
//  ThrustVacuum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct ThrustVacuum : Codable {
    
    let kN : Int?
    let lbf : Int?
    
    enum CodingKeys: String, CodingKey {
        case kN = "kN"
        case lbf = "lbf"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kN = try values.decodeIfPresent(Int.self, forKey: .kN)
        lbf = try values.decodeIfPresent(Int.self, forKey: .lbf)
    }
    
}
