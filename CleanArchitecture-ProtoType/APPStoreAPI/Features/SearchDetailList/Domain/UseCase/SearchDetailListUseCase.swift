//
//  SearchDetailListUseCase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchDetailListUseCase: SearchDetailListUseCaseProtocol {
    let repository: SearchDetailListRepositoryProtocol
    
    init (repository: SearchDetailListRepositoryProtocol) {
        self.repository = repository
    }
    
    func searchDetailListUseCase(searchKeyword: String) -> AnyPublisher<[SearchDetailEntity], Error> {
        repository.searchDetaiListRepository(searchKeyword: searchKeyword)
    }
}
