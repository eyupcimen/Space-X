//
//  Payload.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct LaunchPayload : Codable {
    
    let customers : [String]?
    let manufacturer : String?
    let nationality : String?
    let noradId : [String]?
    let orbit : String?
    let orbitParams : OrbitParam?
    let payloadId : String?
    let payloadMassKg : Int?
    let payloadMassLbs : Int?
    let payloadType : String?
    let reused : Bool?
    let capserial : String?
    
    enum CodingKeys: String, CodingKey {
        case customers = "customers"
        case manufacturer = "manufacturer"
        case nationality = "nationality"
        case noradId = "norad_id"
        case orbit = "orbit"
        case orbitParams = "orbit_params"
        case payloadId = "payload_id"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case payloadType = "payload_type"
        case reused = "reused"
        case capserial = "cap_serial"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customers = try values.decodeIfPresent([String].self, forKey: .customers)
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
        noradId = try values.decodeIfPresent([String].self, forKey: .noradId)
        orbit = try values.decodeIfPresent(String.self, forKey: .orbit)
        orbitParams = try values.decodeIfPresent(OrbitParam.self, forKey: .orbitParams)
        payloadId = try values.decodeIfPresent(String.self, forKey: .payloadId)
        payloadMassKg = try values.decodeIfPresent(Int.self, forKey: .payloadMassKg)
        payloadMassLbs = try values.decodeIfPresent(Int.self, forKey: .payloadMassLbs)
        payloadType = try values.decodeIfPresent(String.self, forKey: .payloadType)
        reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        capserial = try values.decodeIfPresent(String.self, forKey: .capserial)
    }
}
