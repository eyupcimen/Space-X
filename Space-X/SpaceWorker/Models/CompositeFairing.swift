//
//  CompositeFairing.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct CompositeFairing : Codable {
    
    let diameter : Diameter?
    let height : Height?
    
    enum CodingKeys: String, CodingKey {
        case diameter = "diameter"
        case height = "height"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        diameter = try Diameter(from: decoder)
        height = try Height(from: decoder)
    }
}
