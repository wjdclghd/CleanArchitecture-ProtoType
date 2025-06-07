//
//  SearchDetailListRepository.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchDetailListRepository: SearchDetailListRepositoryProtocol {
    let networkServiceProtocol: NetworkServiceProtocol
    
    init (networkServiceProtocol: NetworkServiceProtocol = NetworkService()) {
        self.networkServiceProtocol = networkServiceProtocol
    }
    
    func searchDetaiListRepository(searchKeyword: String) -> AnyPublisher<[SearchDetailEntity], Error> {
        networkServiceProtocol.request(.searchDetailList(searchKeyword: searchKeyword), type: SearchDetailListEntity.self)
            .map {
                $0.results
            }
            .mapError {
                $0 as Error
            }
            .eraseToAnyPublisher()
    }
}
