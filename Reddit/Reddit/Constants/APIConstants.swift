//
//  APIConstants.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

struct APIConstants {
    
    struct Main {
        static let APIUrl = "https://www.reddit.com/.json"
    }
    
    struct Items {
        static let Data = "data"
        static let Children = "children"
        
        struct Listing {
            static let Title = "title"
        }
        
    }
    
    struct Error {
        static let GeneralError = "General Error"
        static let ParsingError = "Parsing Error"
    }
    
}
