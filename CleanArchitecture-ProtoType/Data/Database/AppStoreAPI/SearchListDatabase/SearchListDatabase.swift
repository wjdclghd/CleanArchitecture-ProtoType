//
//  SearchListDatabase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/22/25.
//

import Foundation
import RealmSwift

class SearchListDatabase {
    let realmDatabase = try! Realm()
    
    func insertData(entity: SearchListEntity) {
        try! realmDatabase.write {
            let query = SearchListEntityMapping(name: "", searchKeyWord: entity.searchKeyWord)
            
            realmDatabase.add(query)
        }
    }
    
    func deleteAllData() {
        try! realmDatabase.write {
            realmDatabase.deleteAll()
        }
    }

//    func deleteData(entity: SearchListEntity) {
//        try! realmDatabase.write {
//            realmDatabase.delete(realmDatabase.objects(SearchListEntity.self).filter("searchKeyWord = '\(searchKeyWord)'"))
//        }
//    }
//    
//    func updateData(searchRealm: SearchListEntity, searchKeyWord: String) {
//        try! realmDatabase.write {
//            searchRealm.searchKeyWord = searchKeyWord
//        }
//    }
//    
//    func selectData(searchKeyWord: String) -> Results<SearchListEntity> {
//        let reault = realmDatabase.objects(ofType: SearchListEntity.self).filter("searchKeyWord CONTAINS[c] '\(searchKeyWord)'")
//        
//        return reault
//    }
//    
//    func selectAllData() -> Results<SearchListEntity> {
//        let result = realmDatabase.objects(SearchListEntity.self)
//        
//        return result
//    }
}
