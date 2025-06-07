//
//  SearchDetailListRepositoryProtoco;.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation

import Combine

protocol SearchDetailListRepositoryProtocol {
    func searchDetaiListRepository(keyword: String) -> AnyPublisher<[SearchDetailEntity], Error>
}
