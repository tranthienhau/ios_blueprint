//
//  MoviItemResponse.swift
//  blueprint
//
//  Created by DatNguyen on 14/06/2021.
//

import Foundation

struct MovieItemResponse {
//    let popularity: Double?
//    let voteCount: Int?
//    let video: Bool?
//    let posterPath: String?
    let id: Int?
//    let adult: Bool?
//    let backdropPath: String?
//    let originalTitle: String?
//    let genreIDS: [Int]?
    let title: String?
//    let voteAverage: Double?
//    let overview: String?
//    let releaseDate: String?

    enum MovieItemResponse: String, CodingKey {
//        case popularity
//        case voteCount = "vote_count"
//        case video
//        case posterPath = "poster_path"
        case id
//        case adult
//        case backdropPath = "backdrop_path"
//        case originalTitle = "original_title"
//        case genreIDS = "genre_ids"
        case title
//        case voteAverage = "vote_average"
//        case overview
//        case releaseDate = "release_date"
    }
}

extension MovieItemResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieItemResponse.self)
//        popularity = try container.decode(Double.self, forKey: .popularity)
//        voteCount = try container.decode(Int.self, forKey: .voteCount)
//        video = try container.decode(Bool.self, forKey: .video)
//        posterPath = try container.decode(String.self, forKey: .posterPath)
        id = try container.decode(Int.self, forKey: .id)
//        adult = try container.decode(Bool.self, forKey: .adult)
//        backdropPath = try container.decode(String.self, forKey: .backdropPath)
//        originalTitle = try container.decode(String.self, forKey: .originalTitle)
//        genreIDS = try container.decode([Int].self, forKey: .genreIDS)
        title = try container.decode(String.self, forKey: .title)
//        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
//        overview = try container.decode(String.self, forKey: .overview)
//        releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
}

extension MovieItemResponse: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MovieItemResponse.self)
//        try container.encode(popularity, forKey: .popularity)
//        try container.encode(voteCount, forKey: .voteCount)
//        try container.encode(video, forKey: .video)
//        try container.encode(posterPath, forKey: .posterPath)
        try container.encode(id, forKey: .id)
//        try container.encode(adult, forKey: .adult)
//        try container.encode(backdropPath, forKey: .backdropPath)
//        try container.encode(originalTitle, forKey: .originalTitle)
//        try container.encode(genreIDS, forKey: .genreIDS)
        try container.encode(title, forKey: .title)
//        try container.encode(voteAverage, forKey: .voteAverage)
//        try container.encode(overview, forKey: .overview)
//        try container.encode(releaseDate, forKey: .releaseDate)
    }
}
