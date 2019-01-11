//
//  Collection.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-07.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct CustomCollections: Codable {
    let custom_collections : [Collection]
}

struct Collection: Codable {
    var id: Int
    var handle: String
    var title: String
    var body_html: String
}
