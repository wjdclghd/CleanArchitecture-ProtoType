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
    
    func insert(keyword: String) -> AnyPublisher<Void, Error> {
        repository.insertInterface(keyword: keyword)
    }
    
    func delete(keyword: String) -> AnyPublisher<Void, Error> {
        repository.deleteInterface(keyword: keyword)
    }
    
    func deleteAll() -> AnyPublisher<Void, Error> {
        repository.deleteAllInterface()
    }
    
    func select(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        repository.selectInterface(keyword: keyword)
    }
    
    func selectAll() -> AnyPublisher<[SearchListEntity], Error> {
        repository.selectAllInterface()
    }
    
    func update(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        repository.updateInterface(keyword: keyword)
    }
}
