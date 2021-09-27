//
//  RocketDetailInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailBusinessLogic {
    func doSomething(request: RocketDetail.Something.Request)
}

protocol RocketDetailDataStore {
    //var name: String { get set }
}

class RocketDetailInteractor: RocketDetailBusinessLogic, RocketDetailDataStore {
    var presenter: RocketDetailPresentationLogic?
    var worker: RocketDetailWorker?
    //var name: String = ""
    
    // MARK: Do something
    func doSomething(request: RocketDetail.Something.Request) {
        worker = RocketDetailWorker()
        worker?.doSomeWork()
        
        let response = RocketDetail.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
