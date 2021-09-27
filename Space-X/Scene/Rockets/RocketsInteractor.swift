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
    //var name: String { get set }
    var rockets : [Rockets]? {get}
    var flickrImages : [String]? {get}
}

class RocketsInteractor: RocketsBusinessLogic, RocketsDataStore {
    
    var presenter: RocketsPresentationLogic?
    var worker: RocketsWorker?
    var flickrImages: [String]?
    var rockets: [Rockets]?
    //var name: String = ""
    
    // MARK: Implementaion RocketsBusiniessLogic
    
    func fetchAllRockests(request: Rockets.FetchRockets.Request) {
        worker = RocketsWorker()
        worker?.getAllRocket(completion: { (rockets) in
            let response = Rockets.FetchRockets.Response(rockets: rockets)
            self.presenter?.presentAllRockets(response: response)
        }, failure: { (error) in
        })
    }
}
