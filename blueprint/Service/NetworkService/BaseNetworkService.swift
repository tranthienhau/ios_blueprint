//
//  BaseNetworkService.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import Foundation
import Moya

protocol BaseNetworkService {
    func request<D: Decodable>(target: TargetType, completion: @escaping (Result<D, Error>) -> ())
}

class BaseNetworkRepository < T : TargetType> : BaseNetworkService {
    
    let provider : MoyaProvider<T>?
    
    init() {
        provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    }
    
    func request<D>(target: TargetType, completion: @escaping (Result<D, Error>) -> ()) where D : Decodable {
        
        provider?.request(target as! T) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(D.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

//extension BaseNetworkService {
//    func request<D: Decodable, T: TargetType>(target: T, completion: @escaping (Result<D, Error>) -> ()) {
//
//        let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
//        provider.session.sessionConfiguration.timeoutIntervalForRequest = 30
//        provider.request(target) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let results = try JSONDecoder().decode(D.self, from: response.data)
//                    completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
