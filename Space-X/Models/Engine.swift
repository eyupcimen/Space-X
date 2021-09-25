//
//  Engine.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Engine : Codable {
    
    let engineLossMax : Int?
    let isp : Isp?
    let layout : String?
    let number : Int?
    let propellant1 : String?
    let propellant2 : String?
    let thrustSeaLevel : ThrustSeaLevel?
    let thrustToWeight : Int?
    let thrustVacuum : ThrustVacuum?
    let type : String?
    let version : String?
    
    enum CodingKeys: String, CodingKey {
        case engineLossMax = "engine_loss_max"
        case isp = "isp"
        case layout = "layout"
        case number = "number"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustToWeight = "thrust_to_weight"
        case thrustVacuum = "thrust_vacuum"
        case type = "type"
        case version = "version"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        engineLossMax = try values.decodeIfPresent(Int.self, forKey: .engineLossMax)
        isp = try Isp(from: decoder)
        layout = try values.decodeIfPresent(String.self, forKey: .layout)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        propellant1 = try values.decodeIfPresent(String.self, forKey: .propellant1)
        propellant2 = try values.decodeIfPresent(String.self, forKey: .propellant2)
        thrustSeaLevel = try ThrustSeaLevel(from: decoder)
        thrustToWeight = try values.decodeIfPresent(Int.self, forKey: .thrustToWeight)
        thrustVacuum = try ThrustVacuum(from: decoder)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        version = try values.decodeIfPresent(String.self, forKey: .version)
    }
    
}
