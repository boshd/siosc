//
//  CustomCollection.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-07.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct RootCustomCollections: Codable {
    let custom_collections: [CustomCollection]
}

struct CustomCollection: Codable {
    var id: Int
    var handle: String
    var title: String
    var body: String
    var image: Image
    
    private enum CodingKeys: String, CodingKey {
        case id
        case handle
        case title
        case body = "body_html"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.handle = try container.decode(String.self, forKey: .handle)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.image = try container.decode(Image.self, forKey: .image)
    }
}
