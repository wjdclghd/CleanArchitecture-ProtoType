//
//  SearchListUseCase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

class SearchListUseCase {
    let repository: SearchListInterface
    
    init (repository: SearchListInterface) {
        self.repository = repository
    }
    
    func insertSearchList(completion: @escaping ([SearchListEntity]) -> Void) {
        repository.insertSearchListInterface(completion: completion)
    }
    
    func deleteSearchList(completion: @escaping ([SearchListEntity]) -> Void) {
        repository.deleteSearchListInterface(completion: completion)
    }
}
