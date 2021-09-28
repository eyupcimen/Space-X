//
//  NetworkService.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation

public protocol SpaceWorkerProtocol {
    func getAllRocket(completion:@escaping ([Rocket]) -> Void,failure : @escaping (String) -> Void )
    func getRocketDetail(rocketId:String, completion: @escaping (Rocket) -> Void, failure: @escaping (String) -> Void)
    func getUpcomingLaunches(completion: @escaping ([Launch]) -> Void, failure: @escaping (String) -> Void)
    func getLaunchDetail(launchId:String,completion: @escaping (Launch) -> Void, failure: @escaping (String) -> Void)
}

extension SpaceWorkerProtocol {
    func getAllRocket(completion:@escaping ([Rocket]) -> Void,failure : @escaping (String) -> Void ) {}
    func getRocketDetail(rocketId:String, completion: @escaping (Rocket) -> Void, failure: @escaping (String) -> Void) {}
    func getUpcomingLaunches(completion: @escaping ([Launch]) -> Void, failure: @escaping (String) -> Void) {}
    func getLaunchDetail(launchId:String, completion: @escaping (Launch) -> Void, failure: @escaping (String) -> Void) {}
}

public class SpaceWorker : SpaceWorkerProtocol {
    enum Error : Swift.Error {
        case serilizationError(internal:Swift.Error)
        case networkError(internal:Swift.Error)
    }
    public init () {}

    public func getAllRocket(completion:@escaping ([Rocket]) -> Void,failure : @escaping (String) -> Void ) {
        NetworkAdapter.request(target: ApiService.getAllRockects , success: { (response : BaseResult<Rocket>) in
            completion(response.result ?? [])
        }) { (err) in
            failure("\(err.errorDescription)")
        }
    }
    
    public func getRocketDetail(rocketId:String, completion: @escaping (Rocket) -> Void, failure: @escaping (String) -> Void) {
        NetworkAdapter.request(target: ApiService.getRocketDetail(rocketId: rocketId ) , success: { (response : Rocket) in
            completion(response)
        }) { (err) in
            failure("\(err.errorDescription)")
        }
    }
    
    public func getUpcomingLaunches(completion:@escaping ([Launch]) -> Void,failure : @escaping (String) -> Void ) {
        NetworkAdapter.request(target: ApiService.getUpcomingLaunches , success: { (response : BaseResult<Launch>) in
            completion(response.result ?? [])
        }) { (err) in
            failure("\(err.errorDescription)")
        }
    }
    
    public func getLaunchDetail(launchId:String,completion: @escaping (Launch) -> Void, failure: @escaping (String) -> Void) {
        NetworkAdapter.request(target: ApiService.getLaunchDetail(launchId:launchId) , success: { (response : Launch) in
            completion(response)
        }) { (err) in
            failure("\(err.errorDescription)")
        }
    }
}
