//
//  SearchDetailListUseCase.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation

class SearchDetailListUseCase {
    let repository: SearchDetailListInterface
    
    init (repository: SearchDetailListInterface) {
        self.repository = repository
    }
    
    func searchDetailList(completion: @escaping ([SearchDetailListEntity]) -> Void) {
        repository.searchDetailListInterface(completion: completion)
    }
}
