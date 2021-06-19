//
//  DemoAPIManager.swift
//  blueprint
//
//  Created by DatNguyen on 14/06/2021.
//

import Moya

protocol DemoAPIProtocol {
    func fetchPopularMovies(completion: @escaping (Result<MoviResponse, Error>) -> ())
    func fetchSearchResult(query: String, completion: @escaping (Result<MoviResponse, Error>) -> ())
}

class DemoAPIRepository: BaseNetworkRepository<DemoAPI>, DemoAPIProtocol {
    
    func fetchPopularMovies(completion: @escaping (Result<MoviResponse, Error>) -> ()) {
        request(target: DemoAPI.popular, completion: completion)
    }
    
    func fetchSearchResult(query: String, completion: @escaping (Result<MoviResponse, Error>) -> ()) {
        request(target: DemoAPI.search(query: query), completion: completion)
    }
    
    
//    let provider = MoyaProvider<DemoAPI>(plugins: [NetworkLoggerPlugin()])
//
//    func fetchPopularMovies(completion: @escaping (Result<MoviResponse, Error>) -> ()) {
//        request(target: DemoAPI.popular, completion: completion)
//    }
//
//    func fetchSearchResult(query: String, completion: @escaping (Result<MoviResponse, Error>) -> ()) {
//        request(target: DemoAPI.search(query: query), completion: completion)
//    }
}
