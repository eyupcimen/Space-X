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
//    func getUserPosts(_ userId: Int, _ completion:@escaping ([UserPost]) -> Void, _ failure : @escaping (String) -> Void )
//    func getComments(_ postId: Int, _ completion:@escaping ([PostComment]) -> Void, _ failure : @escaping (String) -> Void )
//    func getAlbums( _ completion:@escaping (AlbumsResponse) -> Void, _ failure : @escaping (String) -> Void )
//    func getPhotos(_ albumId:Int, _ completion:@escaping (PhotosResponse) -> Void, _ failure : @escaping (String) -> Void )
}

extension SpaceWorkerProtocol {
    func getAllRocket(completion:@escaping ([Rocket]) -> Void,failure : @escaping (String) -> Void ) {}
}
//
//public class SpaceWorker : SpaceWorkerProtocol {
//
//    enum Error : Swift.Error {
//        case serilizationError(internal:Swift.Error)
//        case networkError(internal:Swift.Error)
//    }
//
//    public init () {}
//
//    public func getAllRocket(completion:@escaping ([Rocket]) -> Void,failure : @escaping (String) -> Void ) {
//
//        NetworkAdapter.request(target: ApiService.getAllRockects , success: { (response : BaseResult<Rocket>) in
//
//            completion(response.result ?? [])
//
//
////            let json = try? response.mapString()
////            let jsonObject = JSON(parseJSON:json! )
////            let objects = UsersResponse(fromJson: jsonObject)
////            completion(objects)
////
//        }) { (err) in
//            failure("\(err.errorDescription)")
//        }
//    }
////
////    public func getUserPosts(_ userId: Int, _ completion: @escaping ([UserPost]) -> Void, _ failure: @escaping (String) -> Void) {
////
////        NetworkAdapter.request(target: ApiService.getUserPosts(userId:userId), success: { (response) in
////            let json = try? response.mapString()
////            let jsonObject = JSON(parseJSON:json! )
////            let objects = UserPostResponse(fromJson: jsonObject)
////            if objects.posts.count > 0 {
////                completion(objects.posts)
////            }
////        }) { (err) in
////            failure("\(err.localizedDescription)")
////        }
////    }
////
////    public func getComments(_ postId: Int, _ completion: @escaping ([PostComment]) -> Void, _ failure: @escaping (String) -> Void) {
////
////        NetworkAdapter.request(target: ApiService.getComments(postId: postId), success: { (response) in
////
////            let json = try? response.mapString()
////            let jsonObject = JSON(parseJSON:json! )
////            let object = PostCommentResponse(fromJson: jsonObject)
////            completion(object.comments)
////
////        }) { (err) in
////            failure("\(err.localizedDescription)")
////        }
////    }
////
////    public func getAlbums(_ completion: @escaping (AlbumsResponse) -> Void, _ failure: @escaping (String) -> Void) {
////        NetworkAdapter.request(target: ApiService.getAlbums, success: { (response) in
////            let json = try? response.mapString()
////            let jsonObject = JSON(parseJSON:json! )
////            let object = AlbumsResponse(fromJson: jsonObject)
////            completion(object)
////
////        }) { (err) in
////            failure("\(err.localizedDescription)")
////        }
////    }
////
////    public func getPhotos(_ albumId: Int, _ completion: @escaping (PhotosResponse) -> Void, _ failure: @escaping (String) -> Void) {
////        NetworkAdapter.request(target: ApiService.getPhotos(albumId: albumId), success: { (response) in
////            let json = try? response.mapString()
////            let jsonObject = JSON(parseJSON:json! )
////            let object = PhotosResponse(fromJson: jsonObject)
////            completion(object)
////
////        }) { (err) in
////            failure("\(err.localizedDescription)")
////        }
////    }
//}
