//
//  RocketDetailViewController.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailDisplayLogic: class {
    func displayRocketDetail(viewModel: RocketDetail.Detail.ViewModel)
}

class RocketDetailViewController: UIViewController, RocketDetailDisplayLogic {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var carouselView: AACarousel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var interactor: RocketDetailBusinessLogic?
    var router: (NSObjectProtocol & RocketDetailRoutingLogic & RocketDetailDataPassing)?
    
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
        let interactor = RocketDetailInteractor()
        let presenter = RocketDetailPresenter()
        let router = RocketDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        fetchRocketDetail()
    }
    
    // MARK: Do business logic
    private func fetchRocketDetail() {
        guard let router = self.router, let dataStore = router.dataStore else {return}
        let request = RocketDetail.Detail.Request(rocketId: dataStore.rocketId )
        interactor?.getRocketDetail(request: request)
    }
    
    var imagePaths : [String] = []
    var rocket : RocketDetail.Detail.ViewModel.DisplayedRocket?
    
    func displayRocketDetail(viewModel: RocketDetail.Detail.ViewModel) {

        self.rocket = viewModel.displayedRocket
        guard let rocket = self.rocket else {return}
        title = rocket.rocketName
        self.titleLabel.text = rocket.rocketName
        self.detailTextView.text = rocket.description
        self.imagePaths = rocket.flickPaths
        fillSlider()
        favoriteButtonSetImage(rocketId: rocket.id)
    }
    
    private func favoriteButtonSetImage(rocketId:Int) {
        if getCheckFavoriteRocket(rocketId: rocketId ) {
            favoriteButton.setImage(UIImage(named: "star_fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
   
    private func fillSlider() {
        carouselView.delegate = self
        carouselView.setCarouselData(paths: self.imagePaths,  describedTitle: [], isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        carouselView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        carouselView.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: nil)
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        guard let rocket = self.rocket else {return}
        if getCheckFavoriteRocket(rocketId: rocket.id ) {
            removeFavoriteRocket(rocketId: rocket.id)
        } else {
            addFavoriteRocket(rocketId: rocket.id)
        }
        favoriteButtonSetImage(rocketId: rocket.id)
    }
}

extension RocketDetailViewController : AACarouselDelegate {
    
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
    }

    func didSelectCarouselView(_ view: AACarousel ,_ index:Int) {
        /// Not implemented
    }

    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
}
