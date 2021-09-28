//
//  LaunchDetailViewController.swift
//  Space-X
//
//  Created by eyup cimen on 28.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LaunchDetailDisplayLogic: class {
    func displayLaunchDetail(viewModel: LaunchDetail.Detail.ViewModel)
}

class LaunchDetailViewController: UIViewController, LaunchDetailDisplayLogic {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailsLabel : UILabel!
    @IBOutlet weak var launchDateLabel : UILabel!
    @IBOutlet weak var carouselView: AACarousel!
    var interactor: LaunchDetailBusinessLogic?
    var router: (NSObjectProtocol & LaunchDetailRoutingLogic & LaunchDetailDataPassing)?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = LaunchDetailInteractor()
        let presenter = LaunchDetailPresenter()
        let router = LaunchDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        fetchLaunchDetail()
    }
    
    var imagePaths : [String] = []
    var launch : LaunchDetail.Detail.ViewModel.DisplayedLaunch?
    
    func fetchLaunchDetail() {
        guard let router = self.router, let dataStore = router.dataStore else {return}
        let request = LaunchDetail.Detail.Request(launchId: dataStore.launchId )
        interactor?.getLaunchDetail(request: request)
    }
    
    func displayLaunchDetail(viewModel: LaunchDetail.Detail.ViewModel) {
        self.launch = viewModel.displayedLaunch
        guard let launch = self.launch else {return}
        title = launch.rocketName
        titleLabel.text = launch.missionName
        detailsLabel.text = launch.details
        launchDateLabel.text = launch.launchDate
        imagePaths.append(launch.missionPatchBig)
        fillSlider()
    }
    
    private func fillSlider() {
        carouselView.delegate = self
        carouselView.setCarouselData(paths: self.imagePaths,  describedTitle: [], isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        carouselView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        carouselView.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: nil)
    }
}

extension LaunchDetailViewController : AACarouselDelegate {
    
    func downloadImages(_ url: String, _ index:Int) {
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let value):
                self.carouselView.images[index] = value.image
                print("Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(let error):
                print("Error: \(error)")
            }
        })
        imageView.contentMode = .scaleAspectFit
    }

    func didSelectCarouselView(_ view: AACarousel ,_ index:Int) {
        /// Not implemented
    }

    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
        imageView.contentMode = .scaleAspectFit
    }
}
