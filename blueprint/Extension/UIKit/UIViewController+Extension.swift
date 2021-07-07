//
//  UIViewControllerExtension.swift
//  blueprint
//
//  Created by DatNguyen on 15/06/2021.
//

import Toaster
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
        } else
        if navigationController?
            .presentingViewController?
            .presentedViewController == navigationController {
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
        navigationItem.titleView = titleView
    }

    func setupBackButton(color: UIColor = UIColor.black) {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.contentHorizontalAlignment = .left
        button.setImage(UIImage(named: "icon_back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = color
        button.addTarget(self, action: #selector(handleBackAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }

    func setupDismissButton(color: UIColor = UIColor.black) {
        let btnDismiss = UIBarButtonItem(image: UIImage(named: "gray_x"),
                                         style: .plain,
                                         target: self, action: #selector(dismissVC))
        btnDismiss.tintColor = color
        navigationItem.leftBarButtonItem = btnDismiss
    }

    @objc func handleBackAction() {
        dismissVC()
    }

    @objc func dismissVC() {
        if isModal {
            dismiss(animated: true, completion: nil)
        } else {
            popViewController()
        }
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    func showToast(message: String, delay: TimeInterval, time: TimeInterval) {
        let toast = Toast(text: message, delay: delay, duration: time)
        toast.show()
    }
}
