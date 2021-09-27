//
//  Constant.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit
 
enum StoryBoard : String {
     
    case Main
    case MainTabbar
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

extension String {
    static let Main = "Main"
    static let MainTabbar = "MainTabbar"
    static let RocketsViewController = "RocketsViewController"
}
