//
//  Builders.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

final class MainTabbarBuilder {
    static func makeTabbar() -> MainTabbar {
        let storyboard = StoryBoard.MainTabbar.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .MainTabbar ) as! MainTabbar
        return viewController
    }
}


final class RocketListBuilder {
    static func makeRocketList() -> RocketsViewController {
        let storyboard = StoryBoard.Main.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .RocketsViewController ) as! RocketsViewController
        return viewController
    }
}

final class FavoriteRocketListBuilder {
    static func makeFavoriteRocketList() -> FavoriteRocketsViewController {
        let storyboard = StoryBoard.Main.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .FavoriteRocketsViewController ) as! FavoriteRocketsViewController
        return viewController
    }
}

final class UpcomingLaunchesListBuilder {
    static func makeUpcomingLaunchList() -> UpcomingLaunchesViewController {
        let storyboard = StoryBoard.Main.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .UpcomingLaunchesViewController ) as! UpcomingLaunchesViewController
        return viewController
    }
}
