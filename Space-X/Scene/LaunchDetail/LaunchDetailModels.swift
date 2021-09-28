//
//  LaunchDetailModels.swift
//  Space-X
//
//  Created by eyup cimen on 28.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LaunchDetail {
    enum Detail {
        struct Request {
            var launchId : String
        }
        struct Response {
            var launch : Launch
        }
        struct ViewModel {
            struct DisplayedLaunch {
                var missionName : String
                var rocketName : String
                var details : String
                var missionPatchBig : String
                var launchDate : String
            }
            var displayedLaunch: DisplayedLaunch
        }
    }
}
