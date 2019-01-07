//
//  NetworkManager.swift
//  TopMovie
//
//  Created by Amit Azulay on 07/01/2019.
//  Copyright © 2019 Amit Azulay. All rights reserved.
//

import UIKit

//--------------------------------------------------------
typealias Success = () -> Void
typealias dictionary = Dictionary<String, Any>
//--------------------------------------------------------


class NetworkManager {
    //---------------------
    //MARK: local variables
    //---------------------
    static let lang = "&language=en-US&"
    static let apiKey = "api_key=794d64b5d345cde1d5d3f00cdbd460a7"
    static let baseUrl = "https://api.themoviedb.org/3/movie/popular?"
    
    //------------------------------------
    static let session = URLSession.shared
    //------------------------------------
}

extension NetworkManager {
    static func getApiData(with pageNumber: Int, success: @escaping( Success )) {
        let urlStr = "\(baseUrl)\(apiKey)\(lang)page=\(pageNumber)"
        let url = URL(string: urlStr)
        
        session.dataTask(with: url!) { (data, res, err) in
            guard let data = data else { return }
            
            derializationData(with: data) { success() }
            }.resume()
    }
    
    static func derializationData(with data: Data, success: @escaping( Success )){
        if let apiDict = try? JSONSerialization.jsonObject(with: data, options: []) as! dictionary {
            Movie.setData(with: apiDict) { success() }
        }
    }
}

