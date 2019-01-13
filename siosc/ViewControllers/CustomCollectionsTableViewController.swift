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
        setupRegistrations()
        setupFeedDataSource()
        load()
        setupNavigationBar()
        design()
    }

    // Navigation bar
    fileprivate func setupNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Custom Collections"
    }
    
    // Cell design
    fileprivate func design() {
        tableView.backgroundColor = UIColor.offWhite()
        tableView.separatorStyle = .none
    }
    
    // Setup setup cell registration
    fileprivate func setupRegistrations() {
        self.tableView.register(CustomCollectionCell.self, forCellReuseIdentifier: "customCollectionCell")
    }
    
    // Sets up the ProvinceDataSource
    fileprivate func setupFeedDataSource() {
        collectionsDataSource = CustomCollectionsDataSource(tableView: tableView)
        tableView.dataSource = collectionsDataSource
    }
    
    // Loads data from DataSource
    fileprivate func load() {
        collectionsDataSource?.populateUsing(url, completion: { (customCollections) in
            self.custom_collections = customCollections
        })
    }
    
}

extension CustomCollectionsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionDetailsVC: CollectionDetailsViewController = CollectionDetailsViewController()
        collectionDetailsVC.collection = custom_collections[indexPath.row]
        navigationController?.pushViewController(collectionDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
