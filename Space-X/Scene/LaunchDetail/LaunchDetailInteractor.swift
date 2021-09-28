//
//  LaunchDetailInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 28.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LaunchDetailBusinessLogic {
    func getLaunchDetail(request: LaunchDetail.Detail.Request)
}

protocol LaunchDetailDataStore {
    var launchId: String { get set }
}

class LaunchDetailInteractor: LaunchDetailBusinessLogic, LaunchDetailDataStore {
    
    var presenter: LaunchDetailPresentationLogic?
    var worker: SpaceWorker?
    var launchId: String = ""
    
    func getLaunchDetail(request: LaunchDetail.Detail.Request) {
        worker = SpaceWorker()
        worker?.getLaunchDetail(launchId: request.launchId, completion: { (launch) in
            
            let response = LaunchDetail.Detail.Response(launch: launch)
            self.presenter?.presentLaunchDetail(response: response)
            
        }, failure: { (error) in
            
        })
    }
}
