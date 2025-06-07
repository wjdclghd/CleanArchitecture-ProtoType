//
//  SearchListInterface.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

protocol SearchListRepositoryProtocol {
    func insertInterface(searchKeyword: String) -> AnyPublisher<Void, Error>
    
    func deleteInterface(searchKeyword: String) -> AnyPublisher<Void, Error>
    
    func deleteAllInterface() -> AnyPublisher<Void, Error>
    
    func selectInterface(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error>
    
    func selectAllInterface() -> AnyPublisher<[SearchListEntity], Error>
    
    func updateInterface(searchKeyword: String) -> AnyPublisher<[SearchListEntity], Error>
}
