//
//  LaunchDetailPresenter.swift
//  Space-X
//
//  Created by eyup cimen on 28.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LaunchDetailPresentationLogic {
    func presentLaunchDetail(response: LaunchDetail.Detail.Response)
}

class LaunchDetailPresenter: LaunchDetailPresentationLogic {
    weak var viewController: LaunchDetailDisplayLogic?
    
    func presentLaunchDetail(response: LaunchDetail.Detail.Response) {
        let launch = response.launch
        var launchDateUtc = ""
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = formatter.date(from: launch.launchDateUtc ?? "") {
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            launchDateUtc = formatter.string(from: date)
        }
        let displayedLaunch = LaunchDetail.Detail.ViewModel.DisplayedLaunch(missionName: launch.missionName ?? "", rocketName: launch.rocket?.rocketName ?? "", details: launch.details ?? "", missionPatchBig: launch.links?.missionPatch ?? "", launchDate: launchDateUtc)
        let viewModel = LaunchDetail.Detail.ViewModel(displayedLaunch: displayedLaunch)
        viewController?.displayLaunchDetail(viewModel: viewModel)
    }
}

public enum Decoders {
    public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        
        return decoder
    }()
}

