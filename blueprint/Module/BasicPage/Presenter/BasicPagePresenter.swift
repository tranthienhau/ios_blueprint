//
//  BasicPagePresenter.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import Foundation

protocol BasicPagePresenterProtocol: AnyObject {
    func onViewDidLoad()
    func onviewWillAppear()
    func onViewDidAppear()
    func onViewWillDisAppear()
    func onViewDidDisAppear()
}

class BasicPagePresenter {

    private weak var view: BasicPageViewProtocol?
    private var interactor: BasicPageInteractorProtocol
    private var router: BasicPageRouterProtocol

    init(view: BasicPageViewProtocol,
         interactor: BasicPageInteractorProtocol,
         router: BasicPageRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension BasicPagePresenter: BasicPagePresenterProtocol {
    func onViewDidLoad() {}

    func onviewWillAppear() {}

    func onViewDidAppear() {}

    func onViewWillDisAppear() {}

    func onViewDidDisAppear() {}
}

private extension BasicPagePresenter {
    func testPrivate() {
    }
}
