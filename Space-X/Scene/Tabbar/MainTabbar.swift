//
//  MainTabbar.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

class MainTabbar: UITabBarController {
    
    var tabbarItems : [UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rocketListVC = RocketListBuilder.makeRocketList()
        let rocketListItem = UITabBarItem(title: "" , image: UIImage(named: "rocket") , selectedImage: UIImage(named: "rocket_fill") )
        rocketListItem.tag = 0
        rocketListItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        rocketListVC.tabBarItem = rocketListItem
        tabbarItems.append(rocketListItem)
        
        let favoriteRocketListVC = FavoriteRocketListBuilder.makeFavoriteRocketList()
        let favoriteBarItem = UITabBarItem(title: "" , image: UIImage(named: "star") , selectedImage: UIImage(named: "star_fill") )
        favoriteBarItem.tag = 1
        favoriteBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        favoriteRocketListVC.tabBarItem = favoriteBarItem
        tabbarItems.append(favoriteBarItem)
        
        let upcomingLaunchListVC = UpcomingLaunchesListBuilder.makeUpcomingLaunchList()
        let upcomingLaunchBarItem = UITabBarItem(title: "" , image: UIImage(named: "launches") , selectedImage: UIImage(named: "launches_fill") )
        upcomingLaunchBarItem.tag = 2
        upcomingLaunchBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        upcomingLaunchListVC.tabBarItem = upcomingLaunchBarItem
        tabbarItems.append(upcomingLaunchBarItem)
        
        adjustBarItems(tabbarItems)
        self.viewControllers = [rocketListVC,favoriteRocketListVC,upcomingLaunchListVC].map { UINavigationController(rootViewController: $0)}
    }
    
    func adjustBarItems (_ items : [UITabBarItem] )  {
        items.forEach { (item) in
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            item.title = nil
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        }
    }
}
