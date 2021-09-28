//
//  Fairing.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct Fairing : Codable {
    
    let recovered : String?
    let recoveryAttempt : String?
    let reused : String?
    let ship : String?
    
    enum CodingKeys: String, CodingKey {
        case recovered = "recovered"
        case recoveryAttempt = "recovery_attempt"
        case reused = "reused"
        case ship = "ship"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recovered = try values.decodeIfPresent(String.self, forKey: .recovered)
        recoveryAttempt = try values.decodeIfPresent(String.self, forKey: .recoveryAttempt)
        reused = try values.decodeIfPresent(String.self, forKey: .reused)
        ship = try values.decodeIfPresent(String.self, forKey: .ship)
    }
}
