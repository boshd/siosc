//
//  Image.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-12.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

struct Image: Codable {
    var src: String
    
    private enum CodingKeys: String, CodingKey {
        case src
    }
}
