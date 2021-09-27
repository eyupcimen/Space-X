//
//  Builders.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

final class MainTabbarBuilder {
    
    static func makeTabbar() -> MainTabbar {
        let storyboard = StoryBoard.MainTabbar.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .MainTabbar ) as! MainTabbar
        return viewController
    }
}


final class RocketListBuilder {
    
    static func makeRocketList() -> RocketsViewController {
        let storyboard = StoryBoard.Main.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: .RocketsViewController ) as! RocketsViewController
        return viewController
    }
}
//
//
//final class UserDetailBuilder {
//
//    static func makeUserDetail(_ user : UserObject) -> UserDetailViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .UserDetailViewController ) as! UserDetailViewController
//        viewController.viewModel = UserDetailViewModel(service: app.service)
//        viewController.viewModel.user = user
//        return viewController
//    }
//
//    static func makeMap(_ user : UserObject) -> MapViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .MapViewController ) as! MapViewController
//        viewController.address = user.address
//        return viewController
//    }
//}
//
//final class UserPostsBuilder {
//
//    static func makePostList(_ userId : Int) -> UserPostsViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .UserPostsViewController ) as! UserPostsViewController
//        viewController.viewModel = UserPostsViewModel(service: app.service)
//        viewController.viewModel.userId = userId
//        return viewController
//    }
//}
//
//final class PostDetailBuilder {
//
//    static func makePostDetail(_ post : UserPost) -> PostDetailViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .PostDetailViewController ) as! PostDetailViewController
//        viewController.viewModel = PostDetailViewModel(service: app.service)
//        viewController.viewModel.post = post
//        return viewController
//    }
//}
//
//final class CommentDetailBuilder {
//
//    static func makeCommentDetail(_ comment : PostComment) -> CommentDetailViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .CommentDetailViewController ) as! CommentDetailViewController
//        viewController.viewModel = CommentDetailViewModel(service: app.service)
//        viewController.viewModel.comment = comment
//        return viewController
//    }
//}
//
//final class AlbumsBuilder {
//
//    static func makeAlbums() -> AlbumsViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .AlbumsViewController ) as! AlbumsViewController
//        viewController.viewModel = AlbumsViewModel(service: app.service)
//        return viewController
//    }
//}
//
//final class PhotosBuilder {
//
//    static func makePhotos(_ albumId:Int) -> PhotosViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .PhotosViewController ) as! PhotosViewController
//        viewController.viewModel = PhotosViewModel(service: app.service)
//        viewController.viewModel.albumId = albumId
//        return viewController
//    }
//
//    static func makePhotoDetail(_ photo:PhotoObject) -> PhotoDetailViewController {
//        let storyboard = StoryBoard.Main.instance
//        let viewController = storyboard.instantiateViewController(withIdentifier: .PhotoDetailViewController ) as! PhotoDetailViewController
//        viewController.viewModel = PhotoDetailViewModel(service: app.service)
//        viewController.viewModel.photo = photo
//        return viewController
//    }
//}
