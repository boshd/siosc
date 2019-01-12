//
//  CollectionDetailsDataSource.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectionDetailsDataSource: NSObject {
    
    // MARK: - Properties
    var tableView: UITableView
    var collection: CustomCollection!
    var collects = [Collect]()
    var products = [Product]()
    
    // MARK: - Initializer
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    // MARK: - Method(s)
    /// Grabs nicely packaged data from the ShopifyService and feeds it into the table
    func doStuff(_ collection: CustomCollection, completion: @escaping ([Product])  -> Void) {
        APIService.getAPICollectsResponse(collection) { (collects) in
            APIService.getAPIProductsResponse(collects, completion: { (products) in
                // Do something with the products -- Holy shit so fucking elegant kareem. holy shit.
                self.products = products
                self.collects = collects
                self.collection = collection
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                completion(products)
            })
        }
    }
    
}

extension CollectionDetailsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell ?? ProductCell()
        let text = "\(self.products[indexPath.row].title)"
        cell.title.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.products.count > 0 {
            return self.products.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //let text = self.collection.title
        return "text"
    }
    
}




