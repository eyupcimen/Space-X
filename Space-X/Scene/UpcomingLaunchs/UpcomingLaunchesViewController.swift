//
//  UpcomingLaunchesViewController.swift
//  Space-X
//
//  Created by eyup cimen on 27.09.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UpcomingLaunchesDisplayLogic: class {
    func displayUpcomingLaunches(viewModel: UpcomingLaunches.Launches.ViewModel)
}

class UpcomingLaunchesViewController: UIViewController, UpcomingLaunchesDisplayLogic {
    @IBOutlet weak var lTableView: UITableView!
    var interactor: UpcomingLaunchesBusinessLogic?
    var router: (NSObjectProtocol & UpcomingLaunchesRoutingLogic & UpcomingLaunchesDataPassing)?
    
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
        let interactor = UpcomingLaunchesInteractor()
        let presenter = UpcomingLaunchesPresenter()
        let router = UpcomingLaunchesRouter()
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
                router.routeToShowLaunchDetail(segue: segue)
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
        fetchUpcomingLaunches()
    }
    
    fileprivate func setUpUI() {
        title = "Upcoming Launches"
        lTableView.register(MovieTableCell.self)
    }
    
    var upcomingLaunches: [UpcomingLaunches.Launches.ViewModel.DisplayedLaunch] = []
    
    fileprivate func fetchUpcomingLaunches() {
        let request = UpcomingLaunches.Launches.Request()
        interactor?.fetchUpcomingLaunches(request: request)
    }
    
    func displayUpcomingLaunches(viewModel: UpcomingLaunches.Launches.ViewModel) {
        self.upcomingLaunches = viewModel.displayedLaunch
        DispatchQueue.main.async {
            self.lTableView.reloadData()
        }
    }
}

extension UpcomingLaunchesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let upcomingLaunch = upcomingLaunches[indexPath.row]
        let cell = tableView.dequeueReusableCell(MovieTableCell.self)!
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.bindView(launch: upcomingLaunch)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goLaunchDetail",sender: nil)
    }
}

