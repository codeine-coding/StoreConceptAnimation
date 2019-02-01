//
//  ViewController.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 1/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

enum BeerSection: Int {
    case yearRounds
    case seasonals
}

class ViewController: UIViewController {
    let cellID = "Cell ID"
    let headerID = "Header ID"
    let yearRoundBeers = beers.filter({ $0.beerType == BeerType.yearRound })
    let seasonalBeers = beers.filter({ $0.beerType == BeerType.seasonal })
    
    
    let navigationTitleViewImage: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "sw-header-logo")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 32, height: view.frame.width)
        layout.minimumLineSpacing = 16
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //
    //// Override Methods
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitleViewImage
        collectionView.register(BeerCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(BeerSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        setupView()
    }
    
    
    //
    //// Display Methods
    //
    fileprivate func setupView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
    
    //
    //// Action Methods
    //

}


//
//// Extention: UICollectionView Data Source & Delegate
//
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let beerSection = BeerSection(rawValue: section) else { fatalError() }
        
        switch beerSection {
        case .yearRounds:
            return yearRoundBeers.count
        case .seasonals:
            return seasonalBeers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BeerCell
        guard let beerSection = BeerSection(rawValue: indexPath.section) else { fatalError() }
        var beer: Beer
        switch beerSection {
        case .yearRounds :
            beer = yearRoundBeers[indexPath.row]
        case .seasonals:
            beer = seasonalBeers[indexPath.row]
        }
        cell.beer = beer
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionheader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as! BeerSectionHeader
        
       guard let beerSection = BeerSection(rawValue: indexPath.section) else { fatalError() }
        
        let headerTitle: String
        switch beerSection {
        case .yearRounds:
            headerTitle = "Year Rounds"
        case .seasonals:
            headerTitle = "Seasonals"
        }
        
        sectionheader.headerTitle.text = headerTitle
        return sectionheader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

}
