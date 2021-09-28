//
//  UpcomingLaunchesModels.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum UpcomingLaunches {
    enum Launches {
        struct Request {
        }
        struct Response {
            var launches : [Launch]
        }
        struct ViewModel {
            struct DisplayedLaunch {
                var missionName : String
                var rocketName : String
                var details : String
                var missionPatch : String
            }
            var displayedLaunch: [DisplayedLaunch]
        }
    }
}
