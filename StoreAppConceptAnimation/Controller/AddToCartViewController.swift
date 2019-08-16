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
    
    weak var detailViewController: BeerDetailViewController?
    
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
        label.textAlignment = .right
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
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    // stack views
    lazy var titleABVStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.addArrangedSubview(self.titleLabel)
        sv.addArrangedSubview(self.abvLabel)
        return sv
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    fileprivate func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(titleABVStack)
        containerView.addSubview(separatorView)
        view.addSubview(beerImage)
        view.addSubview(addToCartBtn)
        displayConstraints()
        
        addToCartBtn.addTarget(self, action: #selector(addToCartPressed), for: .touchUpInside)
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            beerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            beerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            beerImage.heightAnchor.constraint(equalToConstant: 150),
            beerImage.widthAnchor.constraint(equalToConstant: 46),
            
//            separatorView.topAnchor.constraint(equalTo: titleABVStack.bottomAnchor, constant: 15),
            separatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.75),
            separatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleABVStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleABVStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            titleABVStack.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 8),
            
            
            addToCartBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            addToCartBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addToCartBtn.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            addToCartBtn.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc func addToCartPressed() {
        let prepareCartAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.addToCartBtn.frame.size.width = 60
            self.addToCartBtn.center.x = self.view.center.x
            self.containerView.layer.cornerRadius = 30
            self.containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            self.containerView.frame.size.height = 60
            self.containerView.frame.size.width = 60
            self.containerView.center.x = self.view.center.x
            self.beerImage.center = self.containerView.center
            self.beerImage.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        }
        
        let sendToCartAnimation = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.containerView.center = self.addToCartBtn.center
            self.beerImage.center = self.addToCartBtn.center
        }
        
        
        
        sendToCartAnimation.addCompletion { _ in
            self.detailViewController?.dismissCart()
        }
        prepareCartAnimation.addCompletion { _ in
            sendToCartAnimation.startAnimation()
        }
        prepareCartAnimation.startAnimation()
    }

}
