//
//  DemoAPI.swift
//  blueprint
//
//  Created by DatNguyen on 14/06/2021.
//

import Moya

enum DemoAPI {
    case popular
    case search(query: String)
}

extension DemoAPI : TargetType {

    var baseURL: URL {
        guard let url = URL(string: AppConstants.hostUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .search:
            return "search/movie"
        }
    }
    
    var method: Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
    
    var task: Task {
        switch self {
        case .popular :
            return .requestParameters(parameters: ["api_key": AppConstants.apiKey], encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: ["query" : query, "api_key": AppConstants.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
