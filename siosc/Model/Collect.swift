//
//  Collect.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct RootCollects: Codable {
    let collects: [Collect]
}

struct Collect: Codable {
    let id: Int
    let collection_id: Int
    let product_id: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case collection_id
        case product_id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.collection_id = try container.decode(Int.self, forKey: .collection_id)
        self.product_id = try container.decode(Int.self, forKey: .product_id)
    }
}
