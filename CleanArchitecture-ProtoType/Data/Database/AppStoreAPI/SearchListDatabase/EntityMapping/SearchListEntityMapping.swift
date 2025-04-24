//
//  SearchListEntity+Mapping.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/22/25.
//

import Foundation
import RealmSwift

class SearchListEntityMapping: Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var searchKeyWord: String
    
    convenience init(name: String, searchKeyWord: String) {
        self.init()
        self.name = name
        self.searchKeyWord = searchKeyWord
    }
}
