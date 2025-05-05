//
//  SearchDetailListEntity.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

struct SearchDetailListEntity: Identifiable, Codable {
    let id: Int
    let searchDetailList: [SearchDetail]
}

struct SearchDetail: Codable {
    let isGameCenterEnabled: Bool
    let screenshotUrls: [String]?
    let ipadScreenshotUrls: [String]?
    let appletvScreenshotUrls: [String]?
    let artworkUrl60: String?
    let artworkUrl512: String?
    let artworkUrl100: String?
    let artistViewUrl: String?
    let advisories: [String]?
    let supportedDevices: [String]?
    let kind: String?
    let features: [String]?
    let averageUserRatingForCurrentVersion: Double?
    let trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes: Int?
    let sellerUrl: String?
    let contentAdvisoryRating: String?
    let userRatingCountForCurrentVersion: Int?
    let trackViewUrl: String?
    let trackContentRating: String?
    let sellerName: String?
    let primaryGenreId: String?
    let currentVersionReleaseDate: String?
    let isVppDeviceBasedLicensingEnabled: Bool
    let genreIds: [String]?
    let releaseNotes: String?
    let minimumOsVersion: String?
    let primaryGenreName: String?
    let releaseDate: String?
    let currency: String?
    let wrapperType: String?
    let version: String?
    let description: String?
    let artistId: String?
    let artistName: String?
    let genres: [String]?
    let price: Double?
    let bundleId: String?
    let trackId: String?
    let trackName: String?
    let formattedPrice: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
}
