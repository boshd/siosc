//
//  CollectionsDataSource.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectionsDataSource: NSObject {
    
    // MARK: - Properties
    var tableView: UITableView
    var collections = [Collection]()
    
    // MARK: - Initializer
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    // MARK: - Method(s)
    /// Grabs nicely packaged data from the ShopifyService and feeds it into the table
    func doStuff(_ url: String) {
        ShopifyService.getAPIResponse(url) { (collectionz) in
            self.collections = collectionz
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CollectionsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as? CollectionCell ?? CollectionCell()
        let text = "Collection: \(self.collections[indexPath.row].title)"
        cell.collectionId.text = text
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.collections.count > 0 {
            return self.collections.count
        }
        return 0
    }

}

