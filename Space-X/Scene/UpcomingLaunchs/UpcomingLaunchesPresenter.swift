//
//  UpcomingLaunchesPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UpcomingLaunchesPresentationLogic {
    func presentUpcomingLaunches(response: UpcomingLaunches.Launches.Response)
}

class UpcomingLaunchesPresenter: UpcomingLaunchesPresentationLogic {
    weak var viewController: UpcomingLaunchesDisplayLogic?
    
    func presentUpcomingLaunches(response: UpcomingLaunches.Launches.Response) {
        var displayedUpcomingLaunches: [UpcomingLaunches.Launches.ViewModel.DisplayedLaunch] = []
        for launch in response.launches {
            guard let missionName = launch.missionName else {return}
            let displayedLaunch = UpcomingLaunches.Launches.ViewModel.DisplayedLaunch(missionName: missionName, rocketName: launch.rocket?.rocketName ?? "", details: launch.details ?? "", missionPatch: launch.links?.missionPatchSmall ?? "")
            displayedUpcomingLaunches.append(displayedLaunch)
        }
        let viewModel = UpcomingLaunches.Launches.ViewModel(displayedLaunch: displayedUpcomingLaunches)
        viewController?.displayUpcomingLaunches(viewModel: viewModel)
    }
}
