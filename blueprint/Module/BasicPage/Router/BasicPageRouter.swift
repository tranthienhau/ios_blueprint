//
//  BasicPageRouter.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import UIKit

protocol BasicPageRouterProtocol {}

class BasicPageRouter {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension BasicPageRouter: BasicPageRouterProtocol {}
