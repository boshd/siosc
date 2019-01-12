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

class Collect: Codable {
    let id: Int
    let collection_id: Int
    let product_id: Int
}
