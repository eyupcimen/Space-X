//
//  SecondStage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct SecondStage : Codable {
    
    let burnTimeSec : Int?
    let engines : Int?
    let fuelAmountTons : Int?
    let payloads : Payload?
    let reusable : Bool?
    let thrust : Thrust?
    
    enum CodingKeys: String, CodingKey {
        case burnTimeSec = "burn_time_sec"
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case payloads = "payloads"
        case reusable = "reusable"
        case thrust = "thrust"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        burnTimeSec = try values.decodeIfPresent(Int.self, forKey: .burnTimeSec)
        engines = try values.decodeIfPresent(Int.self, forKey: .engines)
        fuelAmountTons = try values.decodeIfPresent(Int.self, forKey: .fuelAmountTons)
        payloads = try Payload(from: decoder)
        reusable = try values.decodeIfPresent(Bool.self, forKey: .reusable)
        thrust = try Thrust(from: decoder)
    }
    
}
