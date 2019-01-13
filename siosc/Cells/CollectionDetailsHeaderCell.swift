//
//  CollectionDetailsHeaderCell.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-12.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CollectionDetailsHeaderCell: UITableViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionImageView.layer.cornerRadius = 25
        contentView.backgroundColor = UIColor.litPink()
        contentView.layer.cornerRadius = 8
        backgroundColor = UIColor.litPink()
        frame = frame.inset(by: UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
    }
    
    func configureWith(_ custom_collection: CustomCollection) {
        titleLabel.text = custom_collection.title
        bodyLabel.text = custom_collection.body
        if let url = URL(string: custom_collection.image.src) {
            downloadImage(from: url)
        }
    }

}

extension CollectionDetailsHeaderCell {
    func downloadImage(from url: URL) {
        Helper.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.collectionImageView.image = UIImage(data: data)
            }
        }
    }
}
