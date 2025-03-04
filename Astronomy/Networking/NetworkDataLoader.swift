//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by John Pitts on 7/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
    
}

extension URLSession: NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: url) { (data,response,error) in
            completion(data,error)
        }.resume()
    }

}
