//
//  LaunchSite.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct LaunchSite : Codable {
    
    let siteId : String?
    let siteName : String?
    let siteNameLong : String?
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        siteId = try values.decodeIfPresent(String.self, forKey: .siteId)
        siteName = try values.decodeIfPresent(String.self, forKey: .siteName)
        siteNameLong = try values.decodeIfPresent(String.self, forKey: .siteNameLong)
    }
}
