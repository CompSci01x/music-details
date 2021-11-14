//
//  SongItem.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import UIKit

struct SongItem: Codable {
    
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var releaseDate: String?
    var collectionName: String?
    var collectionExplicitness: String?
    var collectionPrice: Double?
    var trackNumber: Int?
    var trackPrice: Double?
    var currency: String?
    var isStreamable: Bool?
    var country: String?
}

struct iTunesSearchResponse: Codable {

    var numOfSongs: Int
    var songItems: [SongItem]
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    // Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        numOfSongs = try container.decode(Int.self, forKey: .resultCount)
        songItems = try container.decode([SongItem].self, forKey: .results)
    }
    
    // Encoding
    func encode(to encoder: Encoder) throws {}
    
}
