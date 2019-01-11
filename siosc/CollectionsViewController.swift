//
//  CollectionsViewController.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-10.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController, UITableViewDelegate {
    
    var tableView: UITableView!
    var collectionsDataSource: CollectionsDataSource?
    var url = "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFeedDataSource()
        load()
    }
    
    // Setup TableView
    func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView.register(CollectionCell.self, forCellReuseIdentifier: "collectionCell")
    }
    
    // Sets up the ProvinceDataSource
    func setupFeedDataSource() {
        collectionsDataSource = CollectionsDataSource(tableView: tableView)
        tableView.dataSource = collectionsDataSource
    }
    
    // Loads data from DataSource
    func load() {
        collectionsDataSource?.doStuff(url)
    }
    
}
