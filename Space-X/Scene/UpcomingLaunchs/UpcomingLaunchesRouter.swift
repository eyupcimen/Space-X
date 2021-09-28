//
//  UpcomingLaunchesRouter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol UpcomingLaunchesRoutingLogic {
    func routeToShowLaunchDetail(segue: UIStoryboardSegue?)
}

protocol UpcomingLaunchesDataPassing {
    var dataStore: UpcomingLaunchesDataStore? { get }
}

class UpcomingLaunchesRouter: NSObject, UpcomingLaunchesRoutingLogic, UpcomingLaunchesDataPassing {
    weak var viewController: UpcomingLaunchesViewController?
    var dataStore: UpcomingLaunchesDataStore?
    
    // MARK: Routing
    func routeToShowLaunchDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! LaunchDetailViewController
            var destinationDataStore = destinationVC.router!.dataStore!
            passDataToShowDetail(source: dataStore!, destination: &destinationDataStore)
        }
    }
    
    // MARK: Navigation
    func passDataToShowDetail(source: UpcomingLaunchesDataStore , destination: inout LaunchDetailDataStore) {
        guard let launches = source.launches, let selectedIndexPath = viewController?.lTableView.indexPathForSelectedRow else {
            return
        }
        if let flightNumber = launches[selectedIndexPath.row].flightNumber {
            destination.launchId = "\(flightNumber)"
        }
    }
}
