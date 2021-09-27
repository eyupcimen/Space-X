//
//  Navıgation+Extension.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func openController(from storyboard: UIStoryboard, withIdentifier identifier: String, animated: Bool = true) {
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        pushViewController(viewController, animated: animated)
    }
}

