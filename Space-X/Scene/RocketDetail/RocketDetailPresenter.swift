//
//  RocketDetailPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailPresentationLogic {
    func presentSomething(response: RocketDetail.Something.Response)
}

class RocketDetailPresenter: RocketDetailPresentationLogic {
    weak var viewController: RocketDetailDisplayLogic?
    
    // MARK: Do something
    func presentSomething(response: RocketDetail.Something.Response) {
        let viewModel = RocketDetail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
