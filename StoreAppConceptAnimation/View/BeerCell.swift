//
//  BeerCell.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 1/31/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BeerCell: UICollectionViewCell {
    
    // property Observer
    var beer: Beer? {
        didSet {
            guard let beerName = beer?.title,
                let beerImage = beer?.photo[0].title
                else { return }
            self.beerName.text = beerName
            self.beerImage.image = UIImage(named: beerImage)
        }
    }
    
    let beerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
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
    
    //
    //// displayMethods
    //
    fileprivate func setupView() {
        addSubview(beerImage)
        addSubview(beerName)
        layer.cornerRadius = 30
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0.7322554652)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            beerName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            beerName.centerXAnchor.constraint(equalTo: centerXAnchor),
            beerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            beerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            beerImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            beerImage.bottomAnchor.constraint(equalTo: beerName.topAnchor, constant: -16),
            beerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            beerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
