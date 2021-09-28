//
//  MovieTableCell.swift
//  Space-X
//
//  Created by eyup cimen on 23.09.2021.
//


import UIKit
import Kingfisher

class MovieTableCell: UITableViewCell {

    @IBOutlet weak var imPoster : UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var id : Int!
    var indexpath : IndexPath?
    var favoriteAction : (IndexPath) -> () = { _ in }
    
    func bindView(rocket : Rockets.FetchRockets.ViewModel.DisplayedRocket)  {
        self.id = rocket.id
        let imagePath = rocket.flickPath[0]
        imPoster.kf.setImage(with: URL(string: imagePath), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let value):
                self.imPoster.image = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
        })
        imPoster.superview?.clipsToBounds = true
        imPoster.clipsToBounds = true
        lblTitle.text = rocket.rocketName
        lblDetail.text = rocket.description
        setFavoriteButtonImage()
    }
    
    func bindView(rocket : FavoriteRockets.Favorite.ViewModel.DisplayedRocket)  {
        self.id = rocket.id
        let imagePath = rocket.flickPaths[0]
        imPoster.kf.setImage(with: URL(string: imagePath), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let value):
                self.imPoster.image = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
        })
        imPoster.superview?.clipsToBounds = true
        imPoster.clipsToBounds = true
        lblTitle.text = rocket.rocketName
        lblDetail.text = rocket.description
        setFavoriteButtonImage()
    }
    
    func bindView(launch : UpcomingLaunches.Launches.ViewModel.DisplayedLaunch)  {
        
        let imagePath = launch.missionPatch
        imPoster.contentMode = .scaleAspectFit
        imPoster.kf.setImage(with: URL(string: imagePath), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { result in
            switch result {
            case .success(let value):
                self.imPoster.image = value.image
            case .failure(let error):
                print("Error: \(error)")
                self.imPoster.contentMode = .scaleAspectFill
            }
        })
        imPoster.superview?.clipsToBounds = true
        imPoster.clipsToBounds = true
        lblTitle.text = launch.missionName
        lblDetail.text = launch.details.isEmpty ? "Doesn't detail" : launch.details
        favoriteButton.isHidden = true
    }
    
    
    fileprivate func setFavoriteButtonImage() {
        if getCheckFavoriteRocket(rocketId: self.id) {
            favoriteButton.setImage(UIImage(named: "star_fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        guard let indexpath = self.indexpath else {
            return
        }
        favoriteAction(indexpath)
    }
}
