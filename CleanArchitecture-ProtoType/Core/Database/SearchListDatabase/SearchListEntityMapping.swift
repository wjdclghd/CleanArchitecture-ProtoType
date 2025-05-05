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
    @Persisted var searchKeyWord: String
    @Persisted var timestamp: Date
    
    convenience init(key: String, searchKeyWord: String, timestamp: Date = Date()) {
        self.init()
        self.key = key
        self.searchKeyWord = searchKeyWord
        self.timestamp = timestamp
    }
}

extension SearchListEntityMapping {
    func toEntity() -> SearchListEntity {
        SearchListEntity(searchKeyWord: searchKeyWord)
    }
    
    convenience init(entity: SearchListEntity, key: String = "SearchDatabase : \(UUID().uuidString)", timestamp: Date = Date()) {
        self.init()
        self.key = key
        self.searchKeyWord = entity.searchKeyWord
        self.timestamp = timestamp
    }
}

extension SearchListEntity {
    init(mapping: SearchListEntityMapping) {
        self.searchKeyWord = mapping.searchKeyWord
    }
}
