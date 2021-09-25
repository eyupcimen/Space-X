//
//  Rocket.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 25, 2021

import Foundation

struct Rocket : Codable {
    
    let active : Bool?
    let boosters : Int?
    let company : String?
    let costPerLaunch : Int?
    let country : String?
    let descriptionField : String?
    let diameter : Diameter?
    let engines : Engine?
    let firstFlight : String?
    let firstStage : FirstStage?
    let flickrImages : [String]?
    let height : Height?
    let id : Int?
    let landingLegs : LandingLeg?
    let mass : Mass?
    let payloadWeights : [PayloadWeight]?
    let rocketId : String?
    let rocketName : String?
    let rocketType : String?
    let secondStage : SecondStage?
    let stages : Int?
    let successRatePct : Int?
    let wikipedia : String?
    
    enum CodingKeys: String, CodingKey {
        case active = "active"
        case boosters = "boosters"
        case company = "company"
        case costPerLaunch = "cost_per_launch"
        case country = "country"
        case descriptionField = "description"
        case diameter = "diameter"
        case engines = "engines"
        case firstFlight = "first_flight"
        case firstStage = "first_stage"
        case flickrImages = "flickr_images"
        case height = "height"
        case id = "id"
        case landingLegs = "landing_legs"
        case mass = "mass"
        case payloadWeights = "payload_weights"
        case rocketId = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case secondStage = "second_stage"
        case stages = "stages"
        case successRatePct = "success_rate_pct"
        case wikipedia = "wikipedia"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        boosters = try values.decodeIfPresent(Int.self, forKey: .boosters)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        costPerLaunch = try values.decodeIfPresent(Int.self, forKey: .costPerLaunch)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        diameter = Diameter(from: decoder)
        engines = Engine(from: decoder)
        firstFlight = try values.decodeIfPresent(String.self, forKey: .firstFlight)
        firstStage = FirstStage(from: decoder)
        flickrImages = try values.decodeIfPresent([String].self, forKey: .flickrImages)
        height = Height(from: decoder)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        landingLegs = LandingLeg(from: decoder)
        mass = Mass(from: decoder)
        payloadWeights = try values.decodeIfPresent([PayloadWeight].self, forKey: .payloadWeights)
        rocketId = try values.decodeIfPresent(String.self, forKey: .rocketId)
        rocketName = try values.decodeIfPresent(String.self, forKey: .rocketName)
        rocketType = try values.decodeIfPresent(String.self, forKey: .rocketType)
        secondStage = SecondStage(from: decoder)
        stages = try values.decodeIfPresent(Int.self, forKey: .stages)
        successRatePct = try values.decodeIfPresent(Int.self, forKey: .successRatePct)
        wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
    }
    
}
