//
//  Variant.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-13.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct RootVariants: Codable {
    let variants: [Variant]
}


struct Variant: Codable {
    var inventory_quantity: Int
    
    private enum CodingKeys: String, CodingKey {
        case inventory_quantity
    }
}
