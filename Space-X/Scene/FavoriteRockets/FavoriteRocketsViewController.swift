//
//  FavoriteRocketsViewController.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteRocketsDisplayLogic: class {
    func displayFavoriteRockets(viewModel: FavoriteRockets.Favorite.ViewModel)
}

class FavoriteRocketsViewController: UIViewController, FavoriteRocketsDisplayLogic {
    
    @IBOutlet weak var fTableView: UITableView!
    var interactor: FavoriteRocketsBusinessLogic?
    var router: (NSObjectProtocol & FavoriteRocketsRoutingLogic & FavoriteRocketsDataPassing)?
    
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
        let interactor = FavoriteRocketsInteractor()
        let presenter = FavoriteRocketsPresenter()
        let router = FavoriteRocketsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil {
            if let router = router {
                router.routeToShowRocketDetail(segue: segue)
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
        title = "Favorite Rockets"
        fTableView.register(MovieTableCell.self)
    }
    
    fileprivate func fetchAllRockets() {
        let request = FavoriteRockets.Favorite.Request()
        interactor?.fetchFavoriteRockets(request: request)
    }
    
    var rockets : [FavoriteRockets.Favorite.ViewModel.DisplayedRocket] = []
    
    func displayFavoriteRockets(viewModel: FavoriteRockets.Favorite.ViewModel) {
        self.rockets = viewModel.displayedRocket
        DispatchQueue.main.async {
            self.fTableView.reloadData()
        }
    }
    
    func favoriteAction(indexpath:IndexPath) {
        let rocket = rockets[indexpath.row]
        if getCheckFavoriteRocket(rocketId: rocket.id) {
            removeFavoriteRocket(rocketId: rocket.id)
        } else {
            addFavoriteRocket(rocketId: rocket.id)
        }
        fetchAllRockets()
    }
}

extension FavoriteRocketsViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        let rocketId = rockets[indexPath.row].rocketName
        performSegue(withIdentifier: "goRocketDetail", sender: ["rocketId" : rocketId ] )
    }
}

