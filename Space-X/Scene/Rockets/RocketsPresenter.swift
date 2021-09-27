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
            guard let id = rocket.id, let rocketName = rocket.rocketName, let description = rocket.descriptionField , let flickrImages = rocket.flickrImages else {return}
            
            let displayedMovie = Rockets.FetchRockets.ViewModel.DisplayedRocket(id: id, rocketName: rocketName, description: description, flickPath: flickrImages)
                                                                               
            displayedRockets.append(displayedMovie)
        }
        let viewModel = Rockets.FetchRockets.ViewModel(displayedRocket: displayedRockets)
        viewController?.displayAllRockests(viewModel: viewModel)
    }
}
