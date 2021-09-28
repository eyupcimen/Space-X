//
//  Launch.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

public struct Launch : Codable {
    
    let rocket : LaunchRocket?
    let crew : String?
    let details : String?
    let flightNumber : Int?
    let isTentative : Bool?
    let lastDateUpdate : String?
    let lastLlLaunchDate : String?
    let lastLlUpdate : String?
    let lastWikiLaunchDate : String?
    let lastWikiRevision : String?
    let lastWikiUpdate : String?
    let launchDateLocal : String?
    let launchDateSource : String?
    let launchDateUnix : Int?
    let launchDateUtc : String?
    let launchSite : LaunchSite?
    let launchSuccess : String?
    let launchWindow : String?
    let launchYear : String?
    let links : Link?
    let missionId : [String]?
    let missionName : String?
    let ships : [String]?
    let staticFireDateUnix : String?
    let staticFireDateUtc : String?
    let tbd : Bool?
    let telemetry : Telemetry?
    let tentativeMaxPrecision : String?
    let timeline : String?
    let upcoming : Bool?
    
    enum CodingKeys: String, CodingKey {
        case crew = "crew"
        case details = "details"
        case flightNumber = "flight_number"
        case isTentative = "is_tentative"
        case lastDateUpdate = "last_date_update"
        case lastLlLaunchDate = "last_ll_launch_date"
        case lastLlUpdate = "last_ll_update"
        case lastWikiLaunchDate = "last_wiki_launch_date"
        case lastWikiRevision = "last_wiki_revision"
        case lastWikiUpdate = "last_wiki_update"
        case launchDateLocal = "launch_date_local"
        case launchDateSource = "launch_date_source"
        case launchDateUnix = "launch_date_unix"
        case launchDateUtc = "launch_date_utc"
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case launchWindow = "launch_window"
        case launchYear = "launch_year"
        case links = "links"
        case missionId = "mission_id"
        case missionName = "mission_name"
        case rocket = "rocket"
        case ships = "ships"
        case staticFireDateUnix = "static_fire_date_unix"
        case staticFireDateUtc = "static_fire_date_utc"
        case tbd = "tbd"
        case telemetry = "telemetry"
        case tentativeMaxPrecision = "tentative_max_precision"
        case timeline = "timeline"
        case upcoming = "upcoming"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rocket = try values.decodeIfPresent(LaunchRocket.self, forKey: .rocket)
        crew = try values.decodeIfPresent(String.self, forKey: .crew)
        details = try values.decodeIfPresent(String.self, forKey: .details)
        flightNumber = try values.decodeIfPresent(Int.self, forKey: .flightNumber)
        isTentative = try values.decodeIfPresent(Bool.self, forKey: .isTentative)
        lastDateUpdate = try values.decodeIfPresent(String.self, forKey: .lastDateUpdate)
        lastLlLaunchDate = try values.decodeIfPresent(String.self, forKey: .lastLlLaunchDate)
        lastLlUpdate = try values.decodeIfPresent(String.self, forKey: .lastLlUpdate)
        lastWikiLaunchDate = try values.decodeIfPresent(String.self, forKey: .lastWikiLaunchDate)
        lastWikiRevision = try values.decodeIfPresent(String.self, forKey: .lastWikiRevision)
        lastWikiUpdate = try values.decodeIfPresent(String.self, forKey: .lastWikiUpdate)
        launchDateLocal = try values.decodeIfPresent(String.self, forKey: .launchDateLocal)
        launchDateSource = try values.decodeIfPresent(String.self, forKey: .launchDateSource)
        launchDateUnix = try values.decodeIfPresent(Int.self, forKey: .launchDateUnix)
        launchDateUtc = try values.decodeIfPresent(String.self, forKey: .launchDateUtc)
        launchSite = try values.decodeIfPresent(LaunchSite.self, forKey: .launchSite)
        launchSuccess = try values.decodeIfPresent(String.self, forKey: .launchSuccess)
        launchWindow = try values.decodeIfPresent(String.self, forKey: .launchWindow)
        launchYear = try values.decodeIfPresent(String.self, forKey: .launchYear)
        links = try values.decodeIfPresent(Link.self, forKey: .links)
        missionId = try values.decodeIfPresent([String].self, forKey: .missionId)
        missionName = try values.decodeIfPresent(String.self, forKey: .missionName)
        ships = try values.decodeIfPresent([String].self, forKey: .ships)
        staticFireDateUnix = try values.decodeIfPresent(String.self, forKey: .staticFireDateUnix)
        staticFireDateUtc = try values.decodeIfPresent(String.self, forKey: .staticFireDateUtc)
        tbd = try values.decodeIfPresent(Bool.self, forKey: .tbd)
        telemetry = try values.decodeIfPresent(Telemetry.self, forKey: .telemetry)
        tentativeMaxPrecision = try values.decodeIfPresent(String.self, forKey: .tentativeMaxPrecision)
        timeline = try values.decodeIfPresent(String.self, forKey: .timeline)
        upcoming = try values.decodeIfPresent(Bool.self, forKey: .upcoming)
    }
}
