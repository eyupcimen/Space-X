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
        let barItem = UITabBarItem(title: " " , image: UIImage(named: "rocket") , selectedImage: UIImage(named: "rocket_fill") )
        barItem.tag = 0
        rocketListVC.tabBarItem = barItem
        tabbarItems.append(barItem)
        
        
        adjustBarItems(tabbarItems)
        
        self.viewControllers = [rocketListVC].map { UINavigationController(rootViewController: $0)}
    }
    
    func adjustMainMenus () {
        
    }
    
    func adjustBarItems (_ items : [UITabBarItem] )  {
        items.forEach { (item) in
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            item.title = nil
        }
    }
    
    
}
