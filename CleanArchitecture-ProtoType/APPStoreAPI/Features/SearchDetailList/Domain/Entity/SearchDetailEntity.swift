//
//  SearchDetailEntity.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation

struct SearchDetailEntity: Identifiable, Codable {
    let id: Int
    let trackName: String?
    let artistName: String?
    let artworkUrl100: String?
    let description: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
    let screenshotUrls: [String]?
    let genres: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artworkUrl100
        case description
        case averageUserRating
        case userRatingCount
        case screenshotUrls
        case genres
    }
}
