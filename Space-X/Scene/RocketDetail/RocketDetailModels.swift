//
//  RocketDetailModels.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RocketDetail {
    enum Detail {
        struct Request {
            var rocketId : String
        }
        struct Response {
            var rocket : Rocket
        }
        struct ViewModel {
            struct DisplayedRocket {
                var id : Int
                var rocketId : String
                var rocketName : String
                var description : String
                var flickPaths : [String]
            }
            var displayedRocket: DisplayedRocket
        }
    }
}
