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
    
    func searchDetaiListRepository(keyword: String) -> AnyPublisher<[SearchDetailEntity], Error> {
        networkServiceProtocol.request(.searchDetailList(keyword: keyword), type: SearchDetailListEntity.self)
            .map {
                $0.results
            }
            .mapError {
                $0 as Error
            }
            .eraseToAnyPublisher()
    }
}
