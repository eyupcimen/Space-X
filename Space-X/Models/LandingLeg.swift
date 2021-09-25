//
//  LandingLeg.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct LandingLeg : Codable {
    
    let material : String?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case material = "material"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        material = try values.decodeIfPresent(String.self, forKey: .material)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
    }
    
}
