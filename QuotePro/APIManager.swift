//
//  APIManager.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation

class APIManager {
    
    func getQuote(endPoint: String, completion: @escaping (Data?, Error?)->(Void)){
        let url = URL(string: "\(endPoint)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("no response returned from server \(String(describing: error))")
                return
            }
            
            guard response.statusCode == 200 else {
                return
            }
            
            completion(data, error)
        }
        dataTask.resume()
    }
}
