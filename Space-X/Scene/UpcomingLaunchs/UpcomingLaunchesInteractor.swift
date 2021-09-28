//
//  UpcomingLaunchesInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UpcomingLaunchesBusinessLogic {
    func fetchUpcomingLaunches(request: UpcomingLaunches.Launches.Request)
}

protocol UpcomingLaunchesDataStore {
    var launches : [Launch]? {get}
}

class UpcomingLaunchesInteractor: UpcomingLaunchesBusinessLogic, UpcomingLaunchesDataStore {
    
    var presenter: UpcomingLaunchesPresentationLogic?
    var worker: SpaceWorker?
    var launches: [Launch]?
    
    func fetchUpcomingLaunches(request: UpcomingLaunches.Launches.Request) {
        worker = SpaceWorker()
        worker?.getUpcomingLaunches(completion: { (launches) in
            self.launches = launches
            let response = UpcomingLaunches.Launches.Response(launches: launches)
            self.presenter?.presentUpcomingLaunches(response: response)
        }, failure: { (error) in
            
        })
    }
}
