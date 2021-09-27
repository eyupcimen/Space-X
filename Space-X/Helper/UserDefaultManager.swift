//
//  Localisator.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

func addFavoriteRocket(rocketId:Int) {
    return UserDefaultManager.instance.addFavoriteRocket(rocketId: rocketId)
}

func removeFavoriteRocket(rocketId:Int) {
    return UserDefaultManager.instance.removeFavoriteRocket(rocketId: rocketId)
}

func getCheckFavoriteRocket(rocketId:Int) -> Bool {
    return UserDefaultManager.instance.getCheckFavoriteRockets(rocketId: rocketId)
}

class UserDefaultManager {
     
    private let userDefaults                    = UserDefaults.standard
    private let kFavoriteRocketDefaultKey         = "kFavoriteRocketDefaultKey"
    
    static let instance = UserDefaultManager()
    
    var saveInUserDefaults:Bool {
        get {
            return (userDefaults.object(forKey: kFavoriteRocketDefaultKey) != nil)
        }
    }

    init() {}
    
    func getCheckFavoriteRockets(rocketId : Int) -> Bool {
        if saveInUserDefaults {
            if let favoriteList = userDefaults.object(forKey: kFavoriteRocketDefaultKey) as? [Int] {
                return (favoriteList.firstIndex(where: {$0 == rocketId}) != nil)
            }
            return false
        }
        return false
    }
    
    func getAllFavoriteRockets() -> [Int]? {
        if saveInUserDefaults {
            return userDefaults.object(forKey: kFavoriteRocketDefaultKey) as? [Int]
        }
        return nil
    }
     
    
    fileprivate func addFavoriteRocket(rocketId:Int) {
        if saveInUserDefaults {
            if var rockets = getAllFavoriteRockets() {
                rockets.append(rocketId)
                userDefaults.set(rockets, forKey: kFavoriteRocketDefaultKey)
                userDefaults.synchronize()
            }
        }
    }
    
    fileprivate func removeFavoriteRocket(rocketId:Int) {
        if saveInUserDefaults {
            if var rockets = getAllFavoriteRockets() {
                let index = rockets.firstIndex(where: { $0 == rocketId})!
                rockets.remove(at: index)
                userDefaults.removeObject(forKey: kFavoriteRocketDefaultKey)
                userDefaults.synchronize()
                userDefaults.set(rockets, forKey: kFavoriteRocketDefaultKey)
                userDefaults.synchronize()
            }
        }
    }
    
    fileprivate func removeRocket(rocketId:String) {

        userDefaults.set([], forKey: kFavoriteRocketDefaultKey)
        userDefaults.removeObject(forKey: kFavoriteRocketDefaultKey)
        userDefaults.synchronize()
    }
}



