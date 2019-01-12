//
//  CollectionsDataSource.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit
import SwiftyJSON

class CustomCollectionsDataSource: NSObject {
    
    // MARK: - Properties
    var tableView: UITableView
    var custom_collections = [CustomCollection]()
    
    // MARK: - Initializer
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    // MARK: - Method(s)
    /// Grabs nicely packaged data from the ShopifyService and feeds it into the table
    func doStuff(_ url: String, completion: @escaping ([CustomCollection])  -> Void) {
        APIService.getAPICustomCollectionsResponse(url) { (customCollections) in
            self.custom_collections = customCollections
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            completion(self.custom_collections)
        }
    }
    
}

extension CustomCollectionsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCollectionCell", for: indexPath) as? CustomCollectionCell ?? CustomCollectionCell()
        let text = "\(self.custom_collections[indexPath.row].title)"
        cell.collectionId.text = text
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.custom_collections.count > 0 {
            return self.custom_collections.count
        }
        return 0
    }

}

