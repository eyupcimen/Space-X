//
//  Util.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class Util {
    static var shared = Util()
    var window = UIWindow()
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func showHud() {
        SVProgressHUD.show()
    }
    @objc func dismissLoading(recognizer: UITapGestureRecognizer) {
        removeHud()
    }
    func removeHud() {
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute:{
                SVProgressHUD.dismiss()
            })
        }
    }
}
