//
//  NetworkDataFetch.swift
//  testTask01.24
//
//  Created by Nikolai  on 15.01.2024.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchLink(urlString: String, response: @escaping(TestLink?, Error?) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                print("Data from request = \(data)")
                do {
                    let testLink = try decoder.decode(TestLink.self, from: data)
                    response(testLink, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
    
}
