//
//  UIViewControllerExtension.swift
//  blueprint
//
//  Created by DatNguyen on 15/06/2021.
//

import Foundation
import UIKit


enum LeftBarItem {
    case none, back, close
}

extension UIViewController {
    
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
    
    func setTitle(title: String, textColor: UIColor = UIColor.black) {
        let lbTitle = UILabel()
        lbTitle.text = title.uppercased()
        lbTitle.textColor = textColor
        let titleView = UIView()
        titleView.addSubview(lbTitle)
        self.navigationItem.titleView = titleView
    }
    
    func setupBackButton(color: UIColor = UIColor.black) {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.contentHorizontalAlignment = .left
        btn.setImage(UIImage(named: "icon_back"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.tintColor = color
        btn.addTarget(self, action: #selector(handleBackAction), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    func setupDismissButton(color: UIColor = UIColor.black) {
        let btnDismiss = UIBarButtonItem.init(image: UIImage(named:"gray_x"), style: .plain, target: self, action: #selector(dismissVC))
        btnDismiss.tintColor = color
        navigationItem.leftBarButtonItem = btnDismiss
    }
    
    @objc func handleBackAction() {
        dismissVC()
    }
    
    @objc func dismissVC() {
        if self.isModal {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.popViewController()
        }
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
