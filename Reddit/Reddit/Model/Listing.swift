//
//  Post.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

class Listing {
    
    var title:String?
    
    init(title:String) {
        self.title = title
    }

    init(data:[String:Any]) {
        self.title = data[APIConstants.Items.Listing.Title] as! String?
    }

    
}
