//
//  SearchListRepository.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

class SearchListRepository: SearchListInterface {
    let searchListDatabase: SearchListDatabase
    
    init (searchListDatabase: SearchListDatabase) {
        self.searchListDatabase = searchListDatabase
    }
    
    func insertSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void) {
//        SearchListDatabase.insertData(entity: SearchListEntity.self)
    }
    
    func deleteSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void) {
//        self.SearchListDatabase.deleteData(entity: SearchListEntity.self)
    }
}
