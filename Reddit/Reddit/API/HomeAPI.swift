//
//  HomeAPI.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

class HomeAPI {
    
    static let sharedInstance = HomeAPI()
    
    func retrievePosts() {
        let url = URL(string: "https://www.reddit.com/.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if data != nil {
                print(data)
            }
        }
        task.resume()
    }
    
}
