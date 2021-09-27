//
//  RocketDetailViewController.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketDetailDisplayLogic: class {
    func displaySomething(viewModel: RocketDetail.Something.ViewModel)
}

class RocketDetailViewController: UIViewController, RocketDetailDisplayLogic {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var carouselView: AACarousel!
    
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
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    var imagePaths : [String] = []
    var titleArray : [String] = []
    
    // MARK: Do something
    func doSomething() {
        let request = RocketDetail.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: RocketDetail.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    
    
    private func fillSlider() {
        carouselView.delegate = self
        carouselView.setCarouselData(paths: self.imagePaths,  describedTitle: self.titleArray , isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        carouselView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        carouselView.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: nil)
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
        /// let movieId = sliderDisplayedMovies[index].id
        /// performSegue(withIdentifier: "goDetail", sender: ["movieId" : movieId])
    }

    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
}
