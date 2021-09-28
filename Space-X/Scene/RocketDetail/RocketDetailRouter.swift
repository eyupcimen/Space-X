//
//  RocketDetailRouter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RocketDetailRoutingLogic {
}

protocol RocketDetailDataPassing {
    var dataStore: RocketDetailDataStore? { get }
}

class RocketDetailRouter: NSObject, RocketDetailRoutingLogic, RocketDetailDataPassing {
    weak var viewController: RocketDetailViewController?
    var dataStore: RocketDetailDataStore?
}
