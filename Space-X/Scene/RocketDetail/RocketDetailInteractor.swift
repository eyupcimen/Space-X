//
//  RocketDetailInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailBusinessLogic {
    func getRocketDetail(request: RocketDetail.Detail.Request)
}

protocol RocketDetailDataStore {
    var rocketId: String { get set }
}

class RocketDetailInteractor: RocketDetailBusinessLogic, RocketDetailDataStore {
    
    var presenter: RocketDetailPresentationLogic?
    var worker: SpaceWorker?
    var rocketId: String = ""
    
    func getRocketDetail(request: RocketDetail.Detail.Request) {
        worker = SpaceWorker()
        worker?.getRocketDetail(rocketId: self.rocketId, completion: { (rocket) in
            
            let response = RocketDetail.Detail.Response(rocket: rocket)
            self.presenter?.presentRocketDetail(response: response)

        }, failure: { (error) in
            
        })
    }
}
