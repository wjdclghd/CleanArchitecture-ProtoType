//
//  SearchListUseCaseProtocol.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import Combine

protocol SearchListUseCaseProtocol {
    func insert(searchKeyword: String) -> AnyPublisher<Void, Error>
    func delete(searchKeyword: String) -> AnyPublisher<Void, Error>
    func deleteAll() -> AnyPublisher<Void, Error>
    func select(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error>
    func selectAll() -> AnyPublisher<[SearchListEntity], Error>
    func update(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error>
}
