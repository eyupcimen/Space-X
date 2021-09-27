//
//  BaseViewController.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var keyboardHideButton  = UIButton()
    var defaultHeight : CGFloat = 0.0
    var heigth : CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultHeight = self.view.frame.size.height
        insertKeyboardDownButton()
    }
     
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(notification:NSNotification) {
        if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardRectValue.height
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.defaultHeight-keyboardHeight)
            self.showKeyboardDownIcon(keyboardHeight: self.defaultHeight-keyboardHeight-35)
        }
    }
    
    @objc func keyboardWillDisappear(notification:NSNotification) {
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.defaultHeight)
        self.hideKeyboardDownIcon()
    }
    
    func setNavBarHide(_ isHidden:Bool) {
        self.navigationController?.navigationBar.isHidden = isHidden
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        self.hideKeyboardDownIcon()
    }
    
//    func showBaseAlert(_ msg : String, _ title : String = Localization("warning")) {
//        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: Localization("ok"), style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    func showBaseAlertWithDismiss (_ msg : String, _ title : String = Localization("warning")) {
//        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: Localization("ok"), style: .cancel, handler: { (alert) in
//            self.navigationController?.popViewController(animated: true)
//        }) )
//        self.present(alert, animated: true, completion: nil)
//    }
}


/// MARK Keyboard Dismiss Button
extension BaseViewController {
    func insertKeyboardDownButton(){
        let image = UIImage(named: "keyboardDownBlack") as UIImage?
        self.keyboardHideButton = UIButton(frame: CGRect(x: self.view.frame.size.width - 40, y: self.view.frame.size.height, width: 32, height: 32))
        self.keyboardHideButton.setImage(image, for: .normal)
        self.keyboardHideButton.addTarget(self, action: #selector(tapKeyboardHiddenBut), for: .touchUpInside)
        self.view.addSubview(self.keyboardHideButton)
    }
    
    func hideKeyboardDownIcon(){
        keyboardHideButton.frame.origin.y = UIScreen.main.bounds.height
        print(defaultHeight)
    }
    
    func showKeyboardDownIcon(keyboardHeight:CGFloat){
        keyboardHideButton.frame.origin.y = keyboardHeight
    }
    
    @objc func tapKeyboardHiddenBut(){
        self.view.endEditing(true)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
    
    func backPop () {
        self.navigationController?.popViewController(animated: true)
    }
}

