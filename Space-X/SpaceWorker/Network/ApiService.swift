//
//  NetworkAdapter.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import Moya

struct AppConst {
    static let baseUrl  = "https://api.spacexdata.com/v3"
}

enum ApiService {
    case getAllRockects
    case getRocketDetail(rocketId:String)
    case getUpcomingLaunches
    case getLaunchDetail(launchId:String)
}

extension ApiService : TargetType {
    
    var baseURL: URL {
        switch self {
        case .getAllRockects, .getRocketDetail, .getUpcomingLaunches, .getLaunchDetail :
            return URL(string: "\(AppConst.baseUrl)")!
        }
    }
    
    var path: String {
        switch self {
        case .getAllRockects:
            return "/rockets"
        case .getRocketDetail(let rocketId):
            return "/rockets/\(rocketId)"
        case .getUpcomingLaunches:
            return "/launches/upcoming"
        case .getLaunchDetail(let launchId):
            return "/launches/\(launchId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllRockects, .getRocketDetail, .getUpcomingLaunches, .getLaunchDetail:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getAllRockects, .getRocketDetail, .getUpcomingLaunches, .getLaunchDetail:
            return [:]
        }
    }
    
    var parameterEncoding:  Moya.ParameterEncoding {
        switch self {
        case .getAllRockects, .getRocketDetail, .getUpcomingLaunches, .getLaunchDetail:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        switch self {
        case .getAllRockects, .getRocketDetail, .getUpcomingLaunches, .getLaunchDetail:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllRockects,.getRocketDetail, .getUpcomingLaunches, .getLaunchDetail:
            return ["Content-type": "application/json","Accept": "application/json"]
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

final class NetworkAdapter {
    @discardableResult static public func request<T:Decodable>(target: ApiService ,
                                                  success successCallBack: @escaping (T) -> Void ,
                                                  failure failureCallBack: @escaping (MoyaError) -> Void) -> Cancellable {
        Util.shared.showHud()
        let networklogger = NetworkLoggerPlugin()
        let pluginsArr      : [PluginType] = [networklogger]
        let provider        = MoyaProvider<ApiService>(plugins:pluginsArr)
        
        return provider.request(target) { result in
            Util.shared.removeHud()
            switch result {
            case let .success(response):
                do{
                    let responseObject = try JSONDecoder().decode(T.self, from: response.data )
                    successCallBack(responseObject)
                } catch {
                    print(String(describing: error))
                }
            case let .failure(error):
                failureCallBack(error)
            }
        }
    }
}


public class BaseResult<T: Codable> : Decodable {

    var result: [T]?
    init(){}
  
    required public init(from decoder: Decoder) throws {
        let values = try decoder.singleValueContainer()
        result = try values.decode([T].self)
    }
}
