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
    
    weak var view: BasicPageViewProtocol?
    var interactor: BasicPageInteractorProtocol?
    var router: BasicPageRouterProtocol?
    
}

extension BasicPagePresenter : BasicPagePresenterProtocol {
    func onViewDidLoad() {
        
    }
    
    func onviewWillAppear() {
        
    }
    
    func onViewDidAppear() {
        
    }
    
    func onViewWillDisAppear() {
        
    }
    
    func onViewDidDisAppear() {
        
    }
}
