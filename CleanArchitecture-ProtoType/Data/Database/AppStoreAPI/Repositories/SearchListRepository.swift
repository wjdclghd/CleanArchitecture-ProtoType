//
//  SearchListRepository.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchListRepository: SearchListInterface {
    let searchListDatabase: SearchListDatabase
    var subscriptions = Set<AnyCancellable>()
    
    init (searchListDatabase: SearchListDatabase) {
        self.searchListDatabase = searchListDatabase
    }
    
    func insertSearchListInterfaceTest(completion: @escaping ([SearchListEntity]) -> Void) {
        searchListDatabase.insertDataTest()
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("DB : SearchListDatabase Finished")
                case .failure(let error):
                    print("DB Error : SearchListDatabase \(error)")
                }
            }, receiveValue: {searchList in
                completion(searchList)
            })
            .store(in: &subscriptions)
    }
    
    func insertSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void) {
//        SearchListDatabase.insertData(entity: SearchListEntity.self)
    }
    
    func deleteSearchListInterface(completion: @escaping ([SearchListEntity]) -> Void) {
//        self.SearchListDatabase.deleteData(entity: SearchListEntity.self)
    }
}
