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
    
    func insertInterface(keyword: String) -> AnyPublisher<Void, Error> {
        guard !keyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.insertDatabase(keyword: keyword)
    }
    
    func deleteInterface(keyword: String) -> AnyPublisher<Void, Error> {
        guard !keyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.deleteDatabase(keyword: keyword)
    }
    
    func deleteAllInterface() -> AnyPublisher<Void, Error> {
        searchListDatabase.deleteAllDatabase()
    }
    
    func selectInterface(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        guard !keyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.selectDatabase(keyword: keyword)
    }
    
    func selectAllInterface() -> AnyPublisher<[SearchListEntity], Error> {
        searchListDatabase.selectAllDatabase()
    }
    
    func updateInterface(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        guard !keyword.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Fail(error: SearchError.invalidQuery).eraseToAnyPublisher()
        }
        
        return searchListDatabase.updateDatabase(keyword: keyword)
    }
}
