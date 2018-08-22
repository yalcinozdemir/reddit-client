//
//  ListingTableViewCell.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var displayingListing:Listing?{
        didSet{
            self.updateUI()
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.configureLabel()
        self.addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if let title = self.displayingListing?.title {
            self.titleLabel?.text = title
        }
    }
    
    func configureLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        self.addSubview(titleLabel)
    }
    
    func addConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -20),
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
        ])
    }

}
