//
//  FavoriteRocketsModels.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FavoriteRockets {
    enum Favorite {
        struct Request {
        }
        struct Response {
            var rockets: [Rocket]
        }
        struct ViewModel {
            struct DisplayedRocket {
                var id : Int
                var rocketId : String
                var rocketName : String
                var description : String
                var flickPaths : [String]
            }
            var displayedRocket: [DisplayedRocket]
        }
    }
}
