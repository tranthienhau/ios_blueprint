//
//  ViewController.swift
//  blueprint
//
//  Created by DatNguyen on 07/06/2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DependencyContainer.sharedInstance.registerServices()
        let demoAPIService: DemoAPIProtocol = DependencyContainer.sharedInstance.getService()
        demoAPIService.fetchPopularMovies(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(movieResponse):
                if let popularMovies = movieResponse.results {
                    print(popularMovies[0].title)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
    }
}
