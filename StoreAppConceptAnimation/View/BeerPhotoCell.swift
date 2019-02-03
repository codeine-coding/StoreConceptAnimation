//
//  BeerPhotoCell.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 2/1/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BeerPhotoCell: UICollectionViewCell {
    let beerImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "sw-header-logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    fileprivate func setupView() {
        addSubview(beerImage)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            beerImage.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            beerImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            beerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            beerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
