//
//  ProductCell.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-12.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionTitleLabel: UILabel!
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .white
        mainView.layer.cornerRadius = 8
        productImageView.layer.cornerRadius = 25
        backgroundColor = UIColor.offBlack()
    }
    
    func configureWith(_ product: Product, collection: CustomCollection) {
        var total = 0
        for variant in product.variants {
            total += variant.inventory_quantity
        }
        collectionTitleLabel.text = collection.title
        totalLabel.text = "Total Inventory: \(String(total))"
        titleLabel.text = product.title
        if let url = URL(string: collection.image.src) {
            downloadImage(from: url, type: "collection")
        }
        if let url = URL(string: product.image.src) {
            downloadImage(from: url, type: "product")
        }
    }

}

extension ProductCell {
    func downloadImage(from url: URL, type: String) {
        Helper.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                if type == "product" {
                    self.productImageView.image = UIImage(data: data)
                } else {
                    self.collectionImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
