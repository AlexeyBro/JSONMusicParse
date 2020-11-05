//
//  NetworkDataFetcher.swift
//  JSONMusicParse
//
//  Created by Alex Bro on 21.07.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, response: @escaping (SearchResponse?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(tracks)
                } catch let jsonError {
                    print(jsonError)
                    response(nil)
                }
            case .failure(let error):
                print(error)
                response(nil)
            }
        }
    }
}
