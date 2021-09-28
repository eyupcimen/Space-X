//
//  RocketDetailPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailPresentationLogic {
    func presentRocketDetail(response: RocketDetail.Detail.Response)
}

class RocketDetailPresenter: RocketDetailPresentationLogic {
    weak var viewController: RocketDetailDisplayLogic?
    
    func presentRocketDetail(response: RocketDetail.Detail.Response) {
        let rocket = response.rocket
        guard let id = rocket.id,let rocketId = rocket.rocketId,let rocketName = rocket.rocketName, let description = rocket.descriptionField, let flickPaths = rocket.flickrImages else {return}
        let displayedRocket = RocketDetail.Detail.ViewModel.DisplayedRocket(id: id, rocketId : rocketId, rocketName: rocketName, description: description, flickPaths: flickPaths)
        let viewModel = RocketDetail.Detail.ViewModel(displayedRocket: displayedRocket)
        viewController?.displayRocketDetail(viewModel: viewModel)
    }
}
