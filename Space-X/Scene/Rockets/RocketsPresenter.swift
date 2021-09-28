//
//  RocketsPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketsPresentationLogic {
    func presentAllRockets(response: Rockets.FetchRockets.Response)
}

class RocketsPresenter: RocketsPresentationLogic {
    weak var viewController: RocketsDisplayLogic?
    // MARK: Present All Rockets
    func presentAllRockets(response: Rockets.FetchRockets.Response) {
        var displayedRockets: [Rockets.FetchRockets.ViewModel.DisplayedRocket] = []
        for rocket in response.rockets {
            guard let id = rocket.id, let rocketId = rocket.rocketId, let rocketName = rocket.rocketName, let description = rocket.descriptionField , let flickrImages = rocket.flickrImages else {return}
            let displayedRocket = Rockets.FetchRockets.ViewModel.DisplayedRocket(id: id, rocketId : rocketId, rocketName: rocketName, description: description, flickPath: flickrImages)
            displayedRockets.append(displayedRocket)
        }
        let viewModel = Rockets.FetchRockets.ViewModel(displayedRocket: displayedRockets)
        viewController?.displayAllRockests(viewModel: viewModel)
    }
}
