//
//  RocketsRouter.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RocketsRoutingLogic {
    func routeToShowRocketDetail(segue: UIStoryboardSegue?)
}

protocol RocketsDataPassing {
    var dataStore: RocketsDataStore? { get }
}

class RocketsRouter: NSObject, RocketsRoutingLogic, RocketsDataPassing {
    weak var viewController: RocketsViewController?
    var dataStore: RocketsDataStore?
    
    // MARK: Routing
    func routeToShowRocketDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! RocketDetailViewController
            var destinationDataStore = destinationVC.router!.dataStore!
            passDataToShowDetail(source: dataStore!, destination: &destinationDataStore)
        }
    }
    // MARK: Navigation
    func passDataToShowDetail(source: RocketsDataStore , destination: inout RocketDetailDataStore) {
        guard let rockets = source.rockets, let selectedIndexPath = viewController?.mTableView.indexPathForSelectedRow else {
            return
        }
        let rocketID = rockets[selectedIndexPath.row].rocketId ?? ""
        destination.rocketId = rocketID
    }
}
