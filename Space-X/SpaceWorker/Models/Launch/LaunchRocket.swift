//
//  Rocket.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct LaunchRocket : Codable {
    
    let fairings : Fairing?
    let firstStage : LaunchFirstStage?
    let rocketId : String?
    let rocketName : String?
    let rocketType : String?
    let secondStage : LaunchSecondStage?
    
    enum CodingKeys: String, CodingKey {
        case fairings = "fairings"
        case firstStage = "first_stage"
        case rocketId = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case secondStage = "second_stage"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fairings = try values.decodeIfPresent(Fairing.self, forKey: .fairings)
        firstStage = try values.decodeIfPresent(LaunchFirstStage.self, forKey: .firstStage)
        rocketId = try values.decodeIfPresent(String.self, forKey: .rocketId)
        rocketName = try values.decodeIfPresent(String.self, forKey: .rocketName)
        rocketType = try values.decodeIfPresent(String.self, forKey: .rocketType)
        secondStage = try values.decodeIfPresent(LaunchSecondStage.self, forKey: .secondStage)
    }
}
