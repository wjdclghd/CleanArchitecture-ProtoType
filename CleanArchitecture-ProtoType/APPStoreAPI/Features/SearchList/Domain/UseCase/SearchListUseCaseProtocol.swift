//
//   SearchListUseCaseProtocol.swift
//  CleanArchitecture-ProtoType
//
//  Created by 201510089 on 5/6/25.
//

import Foundation
import Combine

protocol SearchListUseCaseProtocol {
    func insert(keyword: String) -> AnyPublisher<Void, Error>
    func delete(keyword: String) -> AnyPublisher<Void, Error>
    func deleteAll() -> AnyPublisher<Void, Error>
    func select(keyword: String) -> AnyPublisher<[SearchListEntity], Error>
    func selectAll() -> AnyPublisher<[SearchListEntity], Error>
    func update(keyword: String) -> AnyPublisher<[SearchListEntity], Error>
}
