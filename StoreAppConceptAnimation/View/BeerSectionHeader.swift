//
//  BeerSectionHeader.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 1/31/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BeerSectionHeader: UICollectionReusableView {
    // UI Variables
    let headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "KeeponTruckin", size: 30)
        label.textColor = .black
        label.text = "sections"
        label.textAlignment = .left
        return label
    }()
    
    //
    //// Display Methods
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(headerTitle)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
        
}
