//
//  BuilderBasicPage.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import UIKit

struct BuilderElectionMap {
    static func buildModule() -> UIViewController {
        let view = BasicPageView(nibName: "BasicPageView", bundle: nil)

        // MARK: Initialise components.

        let interactor = BasicPageInteractor()
        let router = BasicPageRouter(viewController: view)
        let presenter = BasicPagePresenter(view: view, interactor: interactor, router: router)

        // MARK: link Viper components.
        // Setup Interactor
        interactor.presenter = presenter

        return view
    }
}
