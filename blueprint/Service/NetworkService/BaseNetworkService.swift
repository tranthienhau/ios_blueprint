//
//  BaseNetworkService.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import Foundation
import Moya

// swiftlint:disable all
protocol BaseNetworkService {
    func request<D: Decodable>(target: TargetType,
                               completion: @escaping (Result<D,
                                   Error>) -> Void)
}

class BaseNetworkRepository<T: TargetType>: BaseNetworkService {
    let provider: MoyaProvider<T>?
    init() {
        provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    }

    func request<D>(target: TargetType,
                    completion: @escaping (Result<D, Error>) -> Void) where D: Decodable
    {
        provider?.request(target as! T) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(D.self, from: response.data)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

// swiftlint:enable all
