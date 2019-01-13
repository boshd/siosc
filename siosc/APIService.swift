//
//  APIService.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-07.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import Foundation

typealias GETAPICustomCollectionsResponseCompletion = ([CustomCollection]) -> Void
typealias GETAPICollectsResponseCompletion = ([Collect])  -> Void
typealias GETAPIProductsResponseCompletion = ([Product])  -> Void

struct APIService {
    
    static func getAPICustomCollectionsResponse(_ url: String, completion: @escaping GETAPICustomCollectionsResponseCompletion) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else { return }
            do {
                let decoded_response = try JSONDecoder().decode(RootCustomCollections.self, from: data)
                completion(decoded_response.custom_collections)
            } catch let err {
                print("err: \(err)")
            }
        }
        task.resume()
    }
    
    static func getAPICollectsResponse(_ collection: CustomCollection, completion: @escaping GETAPICollectsResponseCompletion) {
        let collection_id = collection.id
        guard let url = URL(string: "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(collection_id)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6") else { return }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else { return }
            do {
                let decoded_response = try JSONDecoder().decode(RootCollects.self, from: data)
                completion(decoded_response.collects)
            } catch let err {
                print("err: \(err)")
            }
        }
        task.resume()
    }
    
    static func getAPIProductsResponse(_ collects: [Collect], completion: @escaping GETAPIProductsResponseCompletion) {
        var text = ""
        for collect in collects {
            text += "\(collect.product_id),"
        }
        guard let url = URL(string: "https://shopicruit.myshopify.com/admin/products.json?ids=\(text)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6") else { return }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else { return }
            do {
                let decoded_response = try JSONDecoder().decode(RootProducts.self, from: data)
                completion(decoded_response.products)
            } catch let err {
                print("err: \(err)")
            }
        }
        task.resume()
    }
    
}
