//
//  CollectionsViewController.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-10.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CustomCollectionsViewController: UITableViewController {
    
    var custom_collections = [CustomCollection]()
    var collectionsDataSource: CustomCollectionsDataSource?
    var url = "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFeedDataSource()
        load()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Custom Collections"
    }
    
    // Setup TableView
    func setupTableView() {
        self.tableView.register(CustomCollectionCell.self, forCellReuseIdentifier: "customCollectionCell")
    }
    
    // Sets up the ProvinceDataSource
    func setupFeedDataSource() {
        collectionsDataSource = CustomCollectionsDataSource(tableView: tableView)
        tableView.dataSource = collectionsDataSource
    }
    
    // Loads data from DataSource
    func load() {
        collectionsDataSource?.doStuff(url, completion: { (customCollections) in
            self.custom_collections = customCollections
        })
    }
    
}

extension CustomCollectionsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: CollectionDetailsViewController = CollectionDetailsViewController()
        print(custom_collections.count)
        vc.collection = custom_collections[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
