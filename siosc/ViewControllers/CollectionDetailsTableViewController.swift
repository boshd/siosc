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
        setupRegistrations()
        setupFeedDataSource()
        load()
        setupNavigationBar()
        design()
        tableView.allowsSelection = false
    }
    
    // Cell design
    fileprivate func design() {
        tableView.backgroundColor = UIColor.offWhite()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // Setting up the navigation bar
    fileprivate func setupNavigationBar() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Collection Details"
    }
    
    // Setup TableView
    fileprivate func setupRegistrations() {
        self.tableView.register(UINib(nibName: "CollectionDetailsHeaderCell", bundle:nil),
                           forCellReuseIdentifier: "CollectionDetailsHeaderCell")
        self.tableView.register(UINib(nibName: "ProductCell", bundle:nil),
                                forCellReuseIdentifier: "ProductCell")
    }
    
    // Sets up the ProvinceDataSource
    fileprivate func setupFeedDataSource() {
        collectionDetailsDataSource = CollectionDetailsDataSource(tableView: tableView)
        tableView.dataSource = collectionDetailsDataSource
    }
    
    // Loads data from DataSource
    fileprivate func load() {
        collectionDetailsDataSource?.populateUsing(self.collection, completion: { (products) in
            // do something with the products -- if you want
        })
    }
    
}

extension CollectionDetailsViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionDetailsHeaderCell") as! CollectionDetailsHeaderCell
        cell.configureWith(collection)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
