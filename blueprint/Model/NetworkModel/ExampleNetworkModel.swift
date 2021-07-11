//
//  ExampleNetworkModel.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.
//

import Foundation

struct ExampleNetworkModel {
    let id: Int
    let name: String
    let descriptionModel: String
    enum ExampleCodingKeys: String, CodingKey {
        case id
        case name
        case descriptionModel = "description"
    }
}

extension ExampleNetworkModel: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ExampleCodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        descriptionModel = try container.decode(String.self, forKey: .descriptionModel)
    }
}

extension ExampleNetworkModel: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ExampleCodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(descriptionModel, forKey: .descriptionModel)
    }
}
