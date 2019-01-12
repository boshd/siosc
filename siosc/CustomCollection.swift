//
//  Collection.swift
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
    var body_html: String
}
