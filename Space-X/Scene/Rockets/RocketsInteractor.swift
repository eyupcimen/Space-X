//
//  RocketsInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketsBusinessLogic {
    func fetchAllRockests(request: Rockets.FetchRockets.Request)
}

protocol RocketsDataStore {
    var rockets : [Rocket]? {get}
    var flickrImages : [String]? {get}
}

class RocketsInteractor: RocketsBusinessLogic, RocketsDataStore {
    
    var presenter: RocketsPresentationLogic?
    var worker: SpaceWorker?
    var flickrImages: [String]?
    var rockets: [Rocket]?
    
    // MARK: Fetch All Rocket
    func fetchAllRockests(request: Rockets.FetchRockets.Request) {
        worker = SpaceWorker()
        worker?.getAllRocket(completion: { (rockets) in
            self.rockets = rockets
            let response = Rockets.FetchRockets.Response(rockets: rockets)
            self.presenter?.presentAllRockets(response: response)
        }, failure: { (error) in
        })
    }
}
