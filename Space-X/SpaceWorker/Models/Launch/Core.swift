//
//  Core.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct Core : Codable {
    
    let block : Int?
    let coreSerial : String?
    let flight : Int?
    let gridfins : Bool?
    let landSuccess : Bool?
    let landingIntent : Bool?
    let landingType : String?
    let landingVehicle : String?
    let legs : Bool?
    let reused : Bool?
    
    enum CodingKeys: String, CodingKey {
        case block = "block"
        case coreSerial = "core_serial"
        case flight = "flight"
        case gridfins = "gridfins"
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
        case legs = "legs"
        case reused = "reused"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        block = try values.decodeIfPresent(Int.self, forKey: .block)
        coreSerial = try values.decodeIfPresent(String.self, forKey: .coreSerial)
        flight = try values.decodeIfPresent(Int.self, forKey: .flight)
        gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
        landSuccess = try values.decodeIfPresent(Bool.self, forKey: .landSuccess)
        landingIntent = try values.decodeIfPresent(Bool.self, forKey: .landingIntent)
        landingType = try values.decodeIfPresent(String.self, forKey: .landingType)
        landingVehicle = try values.decodeIfPresent(String.self, forKey: .landingVehicle)
        legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
        reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
    }
}
