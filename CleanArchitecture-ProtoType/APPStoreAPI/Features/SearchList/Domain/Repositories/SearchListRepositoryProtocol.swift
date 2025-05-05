//
//  SearchListInterface.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

protocol SearchListRepositoryProtocol {
    func insertInterface(keyword: String) -> AnyPublisher<Void, Error>
    
    func deleteInterface(keyword: String) -> AnyPublisher<Void, Error>
    
    func deleteAllInterface() -> AnyPublisher<Void, Error>
    
    func selectInterface(keyword: String) -> AnyPublisher<[SearchListEntity], Error>
    
    func selectAllInterface() -> AnyPublisher<[SearchListEntity], Error>
    
    func updateInterface(keyword: String) -> AnyPublisher<[SearchListEntity], Error>
}
