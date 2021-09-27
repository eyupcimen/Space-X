//
//  RocketsModels.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Rockets {
    
    enum FetchRockets {
        struct Request {
        }
        struct Response {
            var rockets : [Rocket]
        }
        struct ViewModel {
            struct DisplayedRocket {
                var id : Int
                var rocketName : String
                var description : String
                var flickPath : [String]
            }
            var displayedRocket: [DisplayedRocket]
        }
    }
}
