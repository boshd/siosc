//
//  CollectionCell.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-11.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit

class CustomCollectionCell: UITableViewCell {
    
    // MARK: - Methods
    func configureWith(_ customCollection: CustomCollection) {
        titleLabel.text = customCollection.title
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
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        
        contentView.addSubview(collectionImageView)
        contentView.addSubview(titleLabel)
        
        collectionImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 26).isActive = true
        collectionImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        collectionImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        collectionImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 26).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: collectionImageView.rightAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CustomCollectionCell {
    
    func downloadImage(from url: URL) {
        Helper.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.collectionImageView.image = UIImage(data: data)
            }
        }
    }
    
}
