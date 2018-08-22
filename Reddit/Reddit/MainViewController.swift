//
//  ViewController.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var listings = [Listing]()
    let reuseIdentifier = "listingCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.addConstraints()
        self.getListings()
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = UIConstants.AppTitle
        let refrestButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonTapped))
        self.navigationItem.setRightBarButton(refrestButton, animated: false)
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.rowHeight = 60
        tableView.backgroundColor = UIColor.clear
        tableView.register(ListingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: tableView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        ])
    }
    
    func getListings() {
        self.prepareForLoading()
        HomeAPI.sharedInstance.retrieveListings { (listings) in
            self.listings = listings
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.configureNavigationBar()
            }
        }
    }
    
    func prepareForLoading() {
        self.navigationItem.title = UIConstants.Loading
        self.navigationItem.setRightBarButton(nil, animated: true)
    }
    
    @objc func refreshButtonTapped() {
        self.listings.removeAll()
        self.tableView.reloadData()
        self.getListings()
    }
    
    // UITableViewDataSource & UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ListingTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        let listing = self.listings[indexPath.row]
        cell.displayingListing = listing
        return cell
    }
    
    
    

}

