//
//  NetworkService.swift
//  JSONMusicParse
//
//  Created by Alex Bro on 20.07.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
