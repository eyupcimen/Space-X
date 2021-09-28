//
//  OrbitParam.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct OrbitParam : Codable {
    
    let apoapsisKm : String?
    let argOfPericenter : String?
    let eccentricity : String?
    let epoch : String?
    let inclinationDeg : String?
    let lifespanYears : Int?
    let longitude : String?
    let meanAnomaly : String?
    let meanMotion : String?
    let periapsisKm : String?
    let periodMin : String?
    let raan : String?
    let referenceSystem : String?
    let regime : String?
    let semiMajorAxisKm : String?
    
    enum CodingKeys: String, CodingKey {
        case apoapsisKm = "apoapsis_km"
        case argOfPericenter = "arg_of_pericenter"
        case eccentricity = "eccentricity"
        case epoch = "epoch"
        case inclinationDeg = "inclination_deg"
        case lifespanYears = "lifespan_years"
        case longitude = "longitude"
        case meanAnomaly = "mean_anomaly"
        case meanMotion = "mean_motion"
        case periapsisKm = "periapsis_km"
        case periodMin = "period_min"
        case raan = "raan"
        case referenceSystem = "reference_system"
        case regime = "regime"
        case semiMajorAxisKm = "semi_major_axis_km"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apoapsisKm = try values.decodeIfPresent(String.self, forKey: .apoapsisKm)
        argOfPericenter = try values.decodeIfPresent(String.self, forKey: .argOfPericenter)
        eccentricity = try values.decodeIfPresent(String.self, forKey: .eccentricity)
        epoch = try values.decodeIfPresent(String.self, forKey: .epoch)
        inclinationDeg = try values.decodeIfPresent(String.self, forKey: .inclinationDeg)
        lifespanYears = try values.decodeIfPresent(Int.self, forKey: .lifespanYears)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        meanAnomaly = try values.decodeIfPresent(String.self, forKey: .meanAnomaly)
        meanMotion = try values.decodeIfPresent(String.self, forKey: .meanMotion)
        periapsisKm = try values.decodeIfPresent(String.self, forKey: .periapsisKm)
        periodMin = try values.decodeIfPresent(String.self, forKey: .periodMin)
        raan = try values.decodeIfPresent(String.self, forKey: .raan)
        referenceSystem = try values.decodeIfPresent(String.self, forKey: .referenceSystem)
        regime = try values.decodeIfPresent(String.self, forKey: .regime)
        semiMajorAxisKm = try values.decodeIfPresent(String.self, forKey: .semiMajorAxisKm)
    }   
}
