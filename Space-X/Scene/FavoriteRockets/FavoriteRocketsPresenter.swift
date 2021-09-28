//
//  FavoriteRocketsPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteRocketsPresentationLogic {
    func presentFavoriteRockets(response: FavoriteRockets.Favorite.Response)
}

class FavoriteRocketsPresenter: FavoriteRocketsPresentationLogic {
    weak var viewController: FavoriteRocketsDisplayLogic?
    
    // MARK: Do something
    func presentFavoriteRockets(response: FavoriteRockets.Favorite.Response) {
        var displayedRockets: [FavoriteRockets.Favorite.ViewModel.DisplayedRocket] = []
        for rocket in response.rockets {
            guard let id = rocket.id,let rocketId = rocket.rocketId, let rocketName = rocket.rocketName, let description = rocket.descriptionField , let flickrImages = rocket.flickrImages else {return}
            let displayedRocket = FavoriteRockets.Favorite.ViewModel.DisplayedRocket(id: id, rocketId: rocketId, rocketName: rocketName, description: description, flickPaths: flickrImages)
            displayedRockets.append(displayedRocket)
        }
        let viewModel = FavoriteRockets.Favorite.ViewModel(displayedRocket: displayedRockets)
        viewController?.displayFavoriteRockets(viewModel: viewModel)
    }
}
