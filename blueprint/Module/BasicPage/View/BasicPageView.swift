//
//  BasicPageView.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import UIKit

protocol BasicPageViewProtocol: AnyObject {
}

class BasicPageView: UIViewController {

    var presenter : BasicPagePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BasicPageView : BasicPageViewProtocol {
}
