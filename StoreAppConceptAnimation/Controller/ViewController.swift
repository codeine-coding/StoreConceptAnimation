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
    let yearRoundBeers = beers.filter({ $0.beerType == BeerType.yearRound })
    let seasonalBeers = beers.filter({ $0.beerType == BeerType.seasonal })
    
    
    let navigationTitleViewImage: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "sw-header-logo")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //
    //// Override Methods
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitleViewImage
        tableView.register(BeerCell.self, forCellReuseIdentifier: cellID)
        setupView()
    }
    
    
    //
    //// Display Methods
    //
    fileprivate func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        displayConstraints()
    }
    
    fileprivate func displayConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
    
    //
    //// Action Methods
    //

}


//
//// Extention: UITableView Data Source & Delegate
//
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let beerSection = BeerSection(rawValue: section) else { fatalError() }
        
        switch beerSection {
        case .yearRounds:
            return yearRoundBeers.count
        case .seasonals:
            return seasonalBeers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BeerCell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let beerSection = BeerSection(rawValue: section) else { fatalError() }
        switch beerSection {
        case .yearRounds:
            return "Year Rounds"
        case .seasonals:
            return "Seasonals"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
}

//
//// TableView Cell
//
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
