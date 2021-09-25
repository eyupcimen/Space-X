//
//  FirstStage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct FirstStage : Codable {
    
    let burnTimeSec : Int?
    let engines : Int?
    let fuelAmountTons : Int?
    let reusable : Bool?
    let thrustSeaLevel : ThrustSeaLevel?
    let thrustVacuum : ThrustVacuum?
    
    enum CodingKeys: String, CodingKey {
        case burnTimeSec = "burn_time_sec"
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case reusable = "reusable"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        burnTimeSec = try values.decodeIfPresent(Int.self, forKey: .burnTimeSec)
        engines = try values.decodeIfPresent(Int.self, forKey: .engines)
        fuelAmountTons = try values.decodeIfPresent(Int.self, forKey: .fuelAmountTons)
        reusable = try values.decodeIfPresent(Bool.self, forKey: .reusable)
        thrustSeaLevel = try ThrustSeaLevel(from: decoder)
        thrustVacuum = try ThrustVacuum(from: decoder)
    }
    
}
