//
//  Helper.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-12.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

struct Helper {
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
