//
//  CollectionCell.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CustomCollectionCell: UITableViewCell {
    var collectionIdLabel = UILabel()
    var collectionNameLabel = UILabel()
    
    // MARK: - Methods
    func configureWith(_ customCollection: CustomCollection) {
        collectionIdLabel.text = String(customCollection.id)
        collectionNameLabel.text = customCollection.title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "customCollectionCell")
        
        collectionIdLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250.0,height: 40))
        contentView.addSubview(collectionIdLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
