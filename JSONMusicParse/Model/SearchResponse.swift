//
//  SearchResponse.swift
//  JSONMusicParse
//
//  Created by Alex Bro on 20.07.2020.
//  Copyright © 2020 Алексей. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Decodable {
    let trackName: String?
    let collectionName: String?
    let artistName: String
    let artworkUrl60: String?
}
