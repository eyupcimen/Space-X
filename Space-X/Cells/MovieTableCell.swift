//
//  MovieTableCell.swift
//  MoviePlanet
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
    
    var rocket : Rockets.FetchRockets.ViewModel.DisplayedRocket!
    var indexpath : IndexPath?
    var favoriteAction : (IndexPath) -> () = { _ in }
    
    func bindView(rocket : Rockets.FetchRockets.ViewModel.DisplayedRocket)  {
        
        self.rocket = rocket
        let posterPath = rocket.flickPath[0]
        imPoster.kf.setImage(with: URL(string: posterPath), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { result in
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
        /// lblDate.text = item.releaseDate
     
        // let check =
        
        //favoriteButton.isSelected = check
        setFavoriteButtonImage()
    }
    
    fileprivate func setFavoriteButtonImage() {
        if getCheckFavoriteRocket(rocketId: rocket.id) {
            favoriteButton.setImage(UIImage(named: "star_fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        //favoriteButton.isSelected = !favoriteButton.isSelected
        guard let indexpath = self.indexpath else {
            return
        }
        favoriteAction(indexpath)
        //setFavoriteButtonImage()
    }
}
