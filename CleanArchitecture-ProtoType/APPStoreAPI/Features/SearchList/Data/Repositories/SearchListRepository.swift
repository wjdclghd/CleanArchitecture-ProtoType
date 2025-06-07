//
//  SearchListRepository.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchListRepository: SearchListRepositoryProtocol {
    private let searchListDatabase: SearchListDatabase
    
    init(searchListDatabase: SearchListDatabase) {
        self.searchListDatabase = searchListDatabase
    }
    
    func insertInterface(searchKeyword: String) -> AnyPublisher<Void, Error> {
        guard !searchKeyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.insertDatabase(searchKeyword: searchKeyword)
    }
    
    func deleteInterface(searchKeyword: String) -> AnyPublisher<Void, Error> {
        guard !searchKeyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.deleteDatabase(searchKeyword: searchKeyword)
    }
    
    func deleteAllInterface() -> AnyPublisher<Void, Error> {
        searchListDatabase.deleteAllDatabase()
    }
    
    func selectInterface(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        guard !searchKeyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.selectDatabase(searchKeyword: searchKeyword)
    }
    
    func selectAllInterface() -> AnyPublisher<[SearchListEntity], Error> {
        searchListDatabase.selectAllDatabase()
    }
    
    func updateInterface(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        guard !searchKeyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.updateDatabase(searchKeyword: searchKeyword)
    }
}
