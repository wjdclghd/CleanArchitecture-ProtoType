//
//  SearchDetailListEntity.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

struct SearchDetailListEntity: Codable {
    let resultCount: Int
    let results: [SearchDetailEntity]
}
