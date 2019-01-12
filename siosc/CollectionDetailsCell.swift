//
//  CollectionDetailsCell.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-12.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    var title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "productCell")
        
        title = UILabel(frame: CGRect(x: 0, y: 0, width: 250.0,height: 40))
        contentView.backgroundColor = UIColor.red
        contentView.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
