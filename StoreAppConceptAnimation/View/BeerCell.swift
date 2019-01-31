//
//  BeerCell.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 1/31/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {
    
    // property Observer
    var beer: Beer? {
        didSet {
            guard let beerName = beer?.title else { return }
            self.beerName.text = beerName
        }
    }
    
    let beerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    //
    //// displayMethods
    //
    fileprivate func setupView() {
        addSubview(beerName)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            beerName.centerXAnchor.constraint(equalTo: centerXAnchor),
            beerName.centerYAnchor.constraint(equalTo: centerYAnchor),
            beerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            beerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
