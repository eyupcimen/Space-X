//
//  RocketsViewController.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RocketsDisplayLogic: class {
    func displayAllRockests(viewModel: Rockets.FetchRockets.ViewModel)
}

class RocketsViewController: BaseViewController, RocketsDisplayLogic {
    
    @IBOutlet weak var mTableView: UITableView!
    var interactor: RocketsBusinessLogic?
    var router: (NSObjectProtocol & RocketsRoutingLogic & RocketsDataPassing)?
    
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
        let interactor = RocketsInteractor()
        let presenter = RocketsPresenter()
        let router = RocketsRouter()
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        setUpUI()
        fetchAllRockets()
    }
    
    fileprivate func setUpUI() {
        title = "All Rockets"
        mTableView.register(MovieTableCell.self)
    }
    
    fileprivate func fetchAllRockets() {
        let request = Rockets.FetchRockets.Request()
        interactor?.fetchAllRockests(request: request)
    }
    
    var rockets : [Rockets.FetchRockets.ViewModel.DisplayedRocket] = []
    
    func displayAllRockests(viewModel: Rockets.FetchRockets.ViewModel) {
        rockets = viewModel.displayedRocket
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
    }
    
    func favoriteAction(indexpath:IndexPath) {
        let rocket = rockets[indexpath.row]
        if getCheckFavoriteRocket(rocketId: rocket.id) {
            removeFavoriteRocket(rocketId: rocket.id)
        } else {
            addFavoriteRocket(rocketId: rocket.id)
        }
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
    }
}


extension RocketsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rocket = rockets[indexPath.row]
        let cell = tableView.dequeueReusableCell(MovieTableCell.self)!
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.bindView(rocket : rocket)
        cell.indexpath = indexPath
        cell.favoriteAction = favoriteAction
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rocketId = rockets[indexPath.row].id
        /// TODO
        /// performSegue(withIdentifier: "goDetail", sender: ["movieId" : rocketId ] )
    }
}

