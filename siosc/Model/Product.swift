//
//  Product.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct RootProducts: Codable {
    let products: [Product]
}

struct Product: Codable {
    var id: Int
    var title: String
    var image: Image
    var variants: [Variant]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case variants
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(Image.self, forKey: .image)
        self.variants = try container.decode([Variant].self, forKey: .variants)
    }
}
