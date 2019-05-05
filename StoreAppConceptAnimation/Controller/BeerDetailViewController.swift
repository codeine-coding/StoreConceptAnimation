//
//  BeerDetailViewController.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 2/1/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    let cellID = "Cell ID"
    //
    //// Property Observers
    var beer: Beer? {
        didSet {
            guard let beerTitle = beer?.title,
                let beerPhotos = beer?.photo,
                let beerSubTitle = beer?.subTitle,
                let beerABV = beer?.abv,
                let beerIBU = beer?.ibus,
                let beerDescription = beer?.description else { return }
            self.titleLabel.text = beerTitle
            self.subTitleLabel.text = beerSubTitle
            self.abvLabel.text = "ABV: \(beerABV)%"
            self.ibuLabel.text = "IBU: \(beerIBU)"
            self.descriptionLabel.text = beerDescription
            self.photos = beerPhotos
            self.pageControl.numberOfPages = beerPhotos.count
            //            self.beerImage.image = UIImage(named: beerImage)
        }
    }
    
    var photos: [Photo]!
    
    lazy var navigationTitleViewImage: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: self.view.center.x - 49, y: 0, width: self.view.frame.width, height: self.navigationItem.titleView?.bounds.height ?? 30))
        iv.image = UIImage(named: "sw-header-logo")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.contentInsetAdjustmentBehavior = .never
        scrollview.backgroundColor = .white
        scrollview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 76, right: 0)
        return scrollview
    }()
    
    lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BeerPhotoCell.self, forCellWithReuseIdentifier: self.cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.9725490196, blue: 0.9333333333, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .lightGray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    let imageHoldingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9469566941, green: 0.7492473722, blue: 0.476852417, alpha: 1)
        return view
    }()
    
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
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
    
    let ibuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    let availableLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AVAILABLE IN"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    //
    //// Stack Views
    lazy var abvibuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(self.ibuLabel)
        stackView.addArrangedSubview(self.abvLabel)
        stackView.backgroundColor = .red
        return stackView
    }()
    
    lazy var titleABVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.titleLabel)
        stackView.addArrangedSubview(self.abvibuStackView)
        return stackView
    }()
    
    lazy var availabilityStackView: UIStackView  = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.availableLable)
        return stackView
    }()
    
    lazy var fullDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        stackView.addArrangedSubview(self.titleABVStackView)
        stackView.addArrangedSubview(self.availabilityStackView)
        stackView.addArrangedSubview(self.subTitleLabel)
        stackView.addArrangedSubview(self.descriptionLabel)
        return stackView
    }()
    
    //
    //// Buttons
    let addToCartBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        let image = UIImage(named: "cart")
        btn.setImage(image, for: .normal)
        let inset: CGFloat = 12
        btn.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        btn.tintColor = .white
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let addContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: -3, height: 1)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    let likeBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        let image = UIImage(named: "heart")
        btn.setImage(image, for: .normal)
        let inset: CGFloat = 12
        btn.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        btn.tintColor = .black
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let likeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: -3, height: 1)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    // view controllers
    let cartController: AddToCartViewController = {
        let cartController = AddToCartViewController()
        cartController.view.translatesAutoresizingMaskIntoConstraints = false
        cartController.view.layer.backgroundColor = UIColor.clear.cgColor
        cartController.view.layer.shadowColor = UIColor.black.cgColor
        cartController.view.layer.shadowOffset = CGSize(width: 0, height: 8)
        cartController.view.layer.shadowRadius = 8
        cartController.view.layer.shadowOpacity = 0.4
        return cartController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitleViewImage
        setupView()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        view.addSubview(addContainerView)
        view.addSubview(likeContainerView)
        view.addSubview(blurView)
        
        addContainerView.addSubview(addToCartBtn)
        likeContainerView.addSubview(likeBtn)
        
        scrollView.addSubview(photoCollectionView)
        scrollView.addSubview(pageControl)
        scrollView.addSubview(fullDetailStackView)
        

        addToCartBtn.addTarget(self, action: #selector(addToCartPressed), for: .touchUpInside)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        blurView.addGestureRecognizer(tapGuesture)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            photoCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            pageControl.bottomAnchor.constraint(equalTo: photoCollectionView.bottomAnchor, constant: -5),
            pageControl.centerXAnchor.constraint(equalTo: photoCollectionView.centerXAnchor),
            
            fullDetailStackView.topAnchor.constraint(equalTo: photoCollectionView.bottomAnchor, constant: 8),
            fullDetailStackView.leadingAnchor.constraint(equalTo: photoCollectionView.leadingAnchor, constant: 16),
            fullDetailStackView.trailingAnchor.constraint(equalTo: photoCollectionView.trailingAnchor, constant: -16),
            fullDetailStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            addContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            addContainerView.heightAnchor.constraint(equalToConstant: 50),
            addContainerView.widthAnchor.constraint(equalToConstant: 50),
            
            likeContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            likeContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            likeContainerView.heightAnchor.constraint(equalToConstant: 50),
            likeContainerView.widthAnchor.constraint(equalToConstant: 50),
            
            addToCartBtn.topAnchor.constraint(equalTo: addContainerView.topAnchor),
            addToCartBtn.bottomAnchor.constraint(equalTo: addContainerView.bottomAnchor),
            addToCartBtn.trailingAnchor.constraint(equalTo: addContainerView.trailingAnchor),
            addToCartBtn.leadingAnchor.constraint(equalTo: addContainerView.leadingAnchor),
            
            likeBtn.topAnchor.constraint(equalTo: likeContainerView.topAnchor),
            likeBtn.bottomAnchor.constraint(equalTo: likeContainerView.bottomAnchor),
            likeBtn.trailingAnchor.constraint(equalTo: likeContainerView.trailingAnchor),
            likeBtn.leadingAnchor.constraint(equalTo: likeContainerView.leadingAnchor),
        ])
        view.layoutIfNeeded()
    }
    
    //
    //// Action Functions
    //
    @objc func addToCartPressed() {
        view.addSubview(cartController.view)
        addChild(cartController)

        cartController.beer = beer
        cartController.detailViewController = self
        NSLayoutConstraint.activate([
            cartController.view.topAnchor.constraint(equalTo: view.bottomAnchor),
            cartController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cartController.view.heightAnchor.constraint(equalToConstant: 406),
        ])
        view.layoutIfNeeded()
        
        let upAnimation = UIViewPropertyAnimator(duration: 0.25, curve: UIView.AnimationCurve.easeIn) {
            self.cartController.didMove(toParent: self)
            self.cartController.view.center.y = self.view.center.y + (self.cartController.view.frame.height / 2)
            self.blurView.alpha = 1
        }
        upAnimation.startAnimation()
    }
    
    @objc func blurViewTapped() {
        if blurView.alpha == 1 {
            dismissCart()
        }
    }
    
    func dismissCart() {
        let dismissAnimation = UIViewPropertyAnimator(duration: 0.25, curve: UIView.AnimationCurve.easeInOut) {
            self.blurView.alpha = 0
            self.cartController.view.center.y = self.view.frame.maxY + (self.cartController.view.frame.height / 2)
        }
        dismissAnimation.addCompletion { _ in
            self.cartController.beerImage.transform = .identity
            self.cartController.view.removeFromSuperview()
            self.cartController.removeFromParent()
        }
        dismissAnimation.startAnimation()
    }
    
}

extension BeerDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BeerPhotoCell
        let photo = photos[indexPath.row].title
        cell.beerImage.image = UIImage(named: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width)
    }
    
    
}
