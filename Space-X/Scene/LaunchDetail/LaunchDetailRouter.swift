//
//  LaunchDetailRouter.swift
//  Space-X
//
//  Created by eyup cimen on 28.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol LaunchDetailRoutingLogic {
}

protocol LaunchDetailDataPassing {
    var dataStore: LaunchDetailDataStore? { get }
}

class LaunchDetailRouter: NSObject, LaunchDetailRoutingLogic, LaunchDetailDataPassing {
    weak var viewController: LaunchDetailViewController?
    var dataStore: LaunchDetailDataStore?
}
