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
                let beerImage = beer?.photo[0].title,
                let abv = beer?.abv
                else { return }
            self.beerName.text = beerName
            self.beerImage.image = UIImage(named: beerImage)
            self.abv.text = "ABV: \(abv)%"
        }
    }
    
    let beerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
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
    
    let abv: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.text = "ABV:"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let heartImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "heart")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let cartImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "cart")
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
        addSubview(abv)
        addSubview(cartImage)
        addSubview(heartImage)
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 1, green: 0.9725490196, blue: 0.9333333333, alpha: 1)
        displayConstraints()
    }
    
    let iconImage: CGFloat = 30
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            
            beerName.bottomAnchor.constraint(equalTo: cartImage.topAnchor, constant: -30),
            beerName.centerXAnchor.constraint(equalTo: centerXAnchor),
            beerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            beerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            beerImage.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            beerImage.bottomAnchor.constraint(equalTo: beerName.topAnchor, constant: -16),
            beerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            beerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            heartImage.heightAnchor.constraint(equalToConstant: iconImage),
            heartImage.widthAnchor.constraint(equalToConstant: iconImage),
            heartImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            heartImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            
            cartImage.heightAnchor.constraint(equalToConstant: iconImage),
            cartImage.widthAnchor.constraint(equalToConstant: iconImage),
            cartImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            cartImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            
            abv.centerXAnchor.constraint(equalTo: centerXAnchor),
            abv.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
