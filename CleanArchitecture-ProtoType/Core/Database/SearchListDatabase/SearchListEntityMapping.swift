//
//  SearchListEntity+Mapping.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/22/25.
//

import Foundation
import RealmSwift

class SearchListEntityMapping: Object {
    @Persisted(primaryKey: true) var key: String
    @Persisted var searchKeyword: String
    @Persisted var timestamp: Date
    
    convenience init(key: String, searchKeyword: String, timestamp: Date = Date()) {
        self.init()
        self.key = key
        self.searchKeyword = searchKeyword
        self.timestamp = timestamp
    }
}

extension SearchListEntityMapping {
    func toEntity() -> SearchListEntity {
        SearchListEntity(searchKeyWord: searchKeyword)
    }
    
    convenience init(entity: SearchListEntity, key: String = "SearchDatabase : \(UUID().uuidString)", timestamp: Date = Date()) {
        self.init()
        self.key = key
        self.searchKeyword = entity.searchKeyword
        self.timestamp = timestamp
    }
}

extension SearchListEntity {
    init(mapping: SearchListEntityMapping) {
        self.searchKeyword = mapping.searchKeyword
    }
}
