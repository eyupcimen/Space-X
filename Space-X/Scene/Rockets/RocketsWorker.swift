//
//  RocketsWorker.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class RocketsWorker : SpaceWorkerProtocol {
    
    func getAllRocket(completion: @escaping ([Rocket]) -> Void, failure: @escaping (String) -> Void) {
        NetworkAdapter.request(target: ApiService.getAllRockects , success: { (response : BaseResult<Rocket>) in
            completion(response.result ?? [])
        }) { (err) in
            failure("\(err.errorDescription)")
        }
    }
}
