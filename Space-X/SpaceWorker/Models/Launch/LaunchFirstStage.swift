//
//  FirstStage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct LaunchFirstStage : Codable {
    
    let cores : [Core]?
    
    enum CodingKeys: String, CodingKey {
        case cores = "cores"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cores = try values.decodeIfPresent([Core].self, forKey: .cores)
    }
}
