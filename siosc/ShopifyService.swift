//
//  ShopifyService.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-07.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import SwiftyJSON

typealias GETAPIResponseCompletion = ([Collection]) -> Void

class ShopifyService {
    
    static func getAPIResponse(_ url: String, completion: @escaping GETAPIResponseCompletion) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!) {
            data, response, error in
            
            guard let data = data else { return }

            do {
                let c = try JSONDecoder().decode(CustomCollections.self, from: data)
                completion(c.custom_collections)
            } catch let err {
                print("err: \(err)")
            }
            
        }
        task.resume()
    }
    
}
