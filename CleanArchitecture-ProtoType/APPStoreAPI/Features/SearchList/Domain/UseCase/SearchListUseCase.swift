//
//  SearchListUseCase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchListUseCase: SearchListUseCaseProtocol {
    private let repository: SearchListRepositoryProtocol
    
    init(repository: SearchListRepositoryProtocol) {
        self.repository = repository
    }
    
    func insert(searchKeyword: String) -> AnyPublisher<Void, Error> {
        repository.insertInterface(searchKeyword: searchKeyword)
    }
    
    func delete(searchKeyword: String) -> AnyPublisher<Void, Error> {
        repository.deleteInterface(searchKeyword: searchKeyword)
    }
    
    func deleteAll() -> AnyPublisher<Void, Error> {
        repository.deleteAllInterface()
    }
    
    func select(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        repository.selectInterface(searchKeyword: searchKeyword)
    }
    
    func selectAll() -> AnyPublisher<[SearchListEntity], Error> {
        repository.selectAllInterface()
    }
    
    func update(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        repository.updateInterface(searchKeyword: searchKeyword)
    }
}
