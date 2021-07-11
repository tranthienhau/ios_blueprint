//
//  BasicPageView.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import UIKit

protocol BasicPageViewProtocol: AnyObject {}

class BasicPageView: UIViewController {

    // IBOut
    // Variable
    // contructor
    // public func
    // private func
    private var presenter: BasicPagePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension BasicPageView: BasicPageViewProtocol {

}
