//
//  BasicPageInteractor.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import Foundation

protocol BasicPageInteractorProtocol {}

class BasicPageInteractor {
    weak var presenter: BasicPagePresenterProtocol?

    init() {
    }

}

extension BasicPageInteractor: BasicPageInteractorProtocol {}
