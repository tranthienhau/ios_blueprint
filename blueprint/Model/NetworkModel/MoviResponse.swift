//
//  MoviResponse.swift
//  blueprint
//
//  Created by DatNguyen on 14/06/2021.
//

import Foundation

struct MoviResponse {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let results: [MovieItemResponse]?
    enum MoviResponse: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

extension MoviResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoviResponse.self)
        page = try container.decode(Int.self, forKey: .page)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
        results = try container.decode([MovieItemResponse].self, forKey: .results)
    }
}

extension MoviResponse: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MoviResponse.self)
        try container.encode(page, forKey: .page)
        try container.encode(totalResults, forKey: .totalResults)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(results, forKey: .results)
    }
}
