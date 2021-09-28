//
//  FavoriteRocketsRouter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol FavoriteRocketsRoutingLogic {
    func routeToShowRocketDetail(segue: UIStoryboardSegue?)
}

protocol FavoriteRocketsDataPassing {
    var dataStore: FavoriteRocketsDataStore? { get }
}

class FavoriteRocketsRouter: NSObject, FavoriteRocketsRoutingLogic, FavoriteRocketsDataPassing {
    weak var viewController: FavoriteRocketsViewController?
    var dataStore: FavoriteRocketsDataStore?
    
    // MARK: Routing
    func routeToShowRocketDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! RocketDetailViewController
            var destinationDataStore = destinationVC.router!.dataStore!
            passDataToShowDetail(source: dataStore!, destination: &destinationDataStore)
        }
    }
    // MARK: Navigation
    func passDataToShowDetail(source: FavoriteRocketsDataStore , destination: inout RocketDetailDataStore) {
        guard let rockets = source.rockets, let selectedIndexPath = viewController?.fTableView.indexPathForSelectedRow else {
            return
        }
        let rocketID = rockets[selectedIndexPath.row].rocketId ?? ""
        destination.rocketId = rocketID
    }
}
