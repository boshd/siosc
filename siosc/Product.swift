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
}
