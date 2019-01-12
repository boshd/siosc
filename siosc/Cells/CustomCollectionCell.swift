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
        if let url = URL(string: customCollection.image.src) {
            downloadImage(from: url)
        }
    }
    
    let collectionImageView: UIImageView = {
        let collectionView = UIImageView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.cornerRadius = 30
        collectionView.layer.masksToBounds = true
        collectionView.contentMode = .scaleAspectFill
        collectionView.backgroundColor = .blue
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        
        contentView.addSubview(collectionImageView)
        
        collectionImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 26).isActive = true
        //collectionImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        collectionImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        collectionImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        collectionImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CustomCollectionCell {
    
    func downloadImage(from url: URL) {
        print("Download Started")
        Helper.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.collectionImageView.image = UIImage(data: data)
            }
        }
    }
    
}
