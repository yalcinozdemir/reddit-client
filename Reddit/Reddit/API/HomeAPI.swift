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
    
    func retrievePosts(completion: @escaping (_ posts: [Listing]) -> Void) {
        var posts = [Listing]()
        let url = URL(string: APIConstants.Main.APIUrl)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? APIConstants.Error.GeneralError)
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [String: Any], let data = jsonArray[APIConstants.Items.Data] as? [String: Any], let children = data[APIConstants.Items.Children] as? [[String: Any]] else {
                    print(APIConstants.Error.GeneralError)
                    return
                }
                for child in children {
                    guard let data = child[APIConstants.Items.Data] as? [String: Any] else {
                        return
                    }
                    let post = Listing(data: data)
                    posts.append(post)
                }
                completion(posts)
            } catch let parsingError {
                print(APIConstants.Error.ParsingError, parsingError)
            }
        }
        task.resume()
    }
    
}
