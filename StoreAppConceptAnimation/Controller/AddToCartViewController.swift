//
//  AddToCartViewController.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 2/2/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {
    
    var beer: Beer? {
        didSet {
            guard let beerTitle = beer?.title,
                let beerPhoto = beer?.photo[0].title,
                let beerABV = beer?.abv else { return }
            self.titleLabel.text = beerTitle
            self.abvLabel.text = "ABV: \(beerABV)%"
            self.beerImage.image = UIImage(named: beerPhoto)
        }
    }
    
    let beerImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "sw-header-logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let abvLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    let selectPurchaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CHOOSE CASE"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let addToCartBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ADD TO CART", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        btn.setImage(UIImage(named: "cart"), for: .normal)
        let inset: CGFloat = 12
        btn.contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.layer.cornerRadius = 30
        btn.clipsToBounds = true
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    fileprivate func setupView() {
        view.addSubview(addToCartBtn)
        view.backgroundColor = .white
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            addToCartBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            addToCartBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addToCartBtn.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            addToCartBtn.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

}
