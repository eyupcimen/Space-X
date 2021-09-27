//
//  GenericTypes.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit


class GenericViewController {
    static let shared = GenericViewController()
    func getVC<T>(_ storyboard : UIStoryboard ,_ identifier : String , _ viewController : T.Type ) -> T {
        let vc = storyboard.instantiateViewController(withIdentifier: "\(T.self)" ) as! T
        return vc
    }
}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
