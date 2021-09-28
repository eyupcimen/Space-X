//
//  Link.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 27, 2021

import Foundation

struct Link : Codable {
    
    let articleLink : String?
    let flickrImages : [String]?
    let missionPatch : String?
    let missionPatchSmall : String?
    let presskit : String?
    let redditCampaign : String?
    let redditLaunch : String?
    let redditMedia : String?
    let redditRecovery : String?
    let videoLink : String?
    let wikipedia : String?
    let youtubeId : String?
    
    enum CodingKeys: String, CodingKey {
        case articleLink = "article_link"
        case flickrImages = "flickr_images"
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case presskit = "presskit"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditMedia = "reddit_media"
        case redditRecovery = "reddit_recovery"
        case videoLink = "video_link"
        case wikipedia = "wikipedia"
        case youtubeId = "youtube_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articleLink = try values.decodeIfPresent(String.self, forKey: .articleLink)
        flickrImages = try values.decodeIfPresent([String].self, forKey: .flickrImages)
        missionPatch = try values.decodeIfPresent(String.self, forKey: .missionPatch)
        missionPatchSmall = try values.decodeIfPresent(String.self, forKey: .missionPatchSmall)
        presskit = try values.decodeIfPresent(String.self, forKey: .presskit)
        redditCampaign = try values.decodeIfPresent(String.self, forKey: .redditCampaign)
        redditLaunch = try values.decodeIfPresent(String.self, forKey: .redditLaunch)
        redditMedia = try values.decodeIfPresent(String.self, forKey: .redditMedia)
        redditRecovery = try values.decodeIfPresent(String.self, forKey: .redditRecovery)
        videoLink = try values.decodeIfPresent(String.self, forKey: .videoLink)
        wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
        youtubeId = try values.decodeIfPresent(String.self, forKey: .youtubeId)
    }
}
