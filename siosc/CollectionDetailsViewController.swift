//
//  CollectionDetailsViewController.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CollectionDetailsViewController: UITableViewController {
    
    var collection: CustomCollection!
    var collectionDetailsDataSource: CollectionDetailsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        setupTableView()
        setupFeedDataSource()
        load()
    }
    
    // Setup TableView
    func setupTableView() {
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: "productCell")
    }
    
    // Sets up the ProvinceDataSource
    func setupFeedDataSource() {
        collectionDetailsDataSource = CollectionDetailsDataSource(tableView: tableView)
        tableView.dataSource = collectionDetailsDataSource
    }
    
    // Loads data from DataSource
    func load() {
        collectionDetailsDataSource?.doStuff(self.collection, completion: { (products) in
            // do something with the products -- if you want
        })
    }
    
}
