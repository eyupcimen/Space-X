//
//  FavoriteRocketsInteractor.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteRocketsBusinessLogic {
    func fetchFavoriteRockets(request: FavoriteRockets.Favorite.Request)
}

protocol FavoriteRocketsDataStore {
    var rockets : [Rocket]? {get set}
}

class FavoriteRocketsInteractor: FavoriteRocketsBusinessLogic, FavoriteRocketsDataStore {
    var rockets: [Rocket]?
    var presenter: FavoriteRocketsPresentationLogic?
    var worker: SpaceWorker?
    
    func fetchFavoriteRockets(request: FavoriteRockets.Favorite.Request) {
        worker = SpaceWorker()
        worker?.getAllRocket(completion: { (rockets) in
            if let favoriteRocketIds = getFavoriteRockets() {
                self.rockets = rockets.filter({ favoriteRocketIds.contains($0.id ?? 0) })
            }
            let response = FavoriteRockets.Favorite.Response(rockets: self.rockets ?? [])
            self.presenter?.presentFavoriteRockets(response: response)
        }, failure: { (error) in
        })
    }
}
