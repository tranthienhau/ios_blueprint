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
        let presenter = BasicPagePresenter()
        let interactor = BasicPageInteractor()
        let router = BasicPageRouter()
        // MARK: link Viper components.
        // Setup View
        view.presenter = presenter
        // Setup Presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        // Setup Interactor
        interactor.presenter = presenter
        // Setup Router
        router.viewController = view
        return view
    }
}
