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
    
    case getUserPosts(userId:Int)
    case getComments(postId:Int)
    case getAlbums
    case getPhotos(albumId:Int)
}

extension ApiService : TargetType {
    
    var baseURL: URL {
        switch self {
        case .getAllRockects, .getUserPosts, .getComments, .getAlbums, .getPhotos :
            return URL(string: "\(AppConst.baseUrl)")!
        }
    }
    
    var path: String {
        switch self {
        case .getAllRockects:
            return "/rockets"
        case .getUserPosts:
            return "/posts"
        case .getComments:
            return "/comments"
        case .getAlbums:
            return "/albums"
        case .getPhotos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllRockects, .getUserPosts, .getComments, .getAlbums, .getPhotos:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        
        switch self {
        case .getAllRockects, .getAlbums:
            return [:]
        case .getUserPosts(let userId):
            return ["userId":userId]
        case .getComments(let postId):
            return ["postId":postId]
        case .getPhotos(let albumId):
            return ["albumId":albumId]
        }
    }
    
    var parameterEncoding:  Moya.ParameterEncoding {
        switch self {
        case .getAllRockects, .getAlbums:
            return URLEncoding.default
        case .getUserPosts, .getComments, .getPhotos:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .getAllRockects, .getAlbums:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        case .getUserPosts(let userId):
            return .requestParameters(parameters: ["userId":userId], encoding: URLEncoding.queryString)
        case .getComments(let postId):
            return .requestParameters(parameters: ["postId":postId], encoding: URLEncoding.queryString)

        case .getPhotos(let albumId):
            return .requestParameters(parameters: ["albumId":albumId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAllRockects, .getUserPosts, .getComments, .getAlbums, .getPhotos:
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
        let networklogger = NetworkLoggerPlugin()
        let pluginsArr      : [PluginType] = [networklogger]
        let provider        = MoyaProvider<ApiService>(plugins:pluginsArr)
        
        return provider.request(target) { result in
            switch result {
            case let .success(response):
                do{
                    print(try response.mapString())
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

public class RocketsResponse<T: Codable> : Decodable {
    
    let rockects : [T]?
  
    required public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rockects = try container.decode([T].self)
    }
}


@propertyWrapper
struct DefaultEmptyArray<T:Codable> {
    var wrappedValue: [T] = []
}

extension DefaultEmptyArray: Codable {
    func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode([T].self)
    }
}

extension KeyedDecodingContainer {
    func decode<T:Decodable>(_ type: DefaultEmptyArray<T>.Type,
                forKey key: Key) throws -> DefaultEmptyArray<T> {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}
