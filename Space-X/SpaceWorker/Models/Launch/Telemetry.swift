//
//  Telemetry.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct Telemetry : Codable {
    
    let flightClub : String?
    
    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flightClub = try values.decodeIfPresent(String.self, forKey: .flightClub)
    }
}
