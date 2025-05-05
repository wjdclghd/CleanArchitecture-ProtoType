//
//  MockSearchListUseCase.swift
//  CleanArchitecture-ProtoTypeTests
//
//  Created by 201510089 on 5/6/25.
//

@testable import CleanArchitecture_ProtoType

import Foundation
import Combine

final class MockSearchListUseCase: SearchListUseCaseProtocol {
    
    // MARK: - 호출 여부 및 파라미터 추적용 변수
    
    private(set) var didCallInsert = false
    private(set) var insertedKeyword: String?
    
    private(set) var didCallDelete = false
    private(set) var deletedKeyword: String?
    
    private(set) var didCallDeleteAll = false
    
    private(set) var didCallSelect = false
    private(set) var selectedKeyword: String?
    
    private(set) var didCallSelectAll = false
    
    private(set) var didCallUpdate = false
    private(set) var updatedKeyword: String?
    
    // MARK: - Stubbed 결과값
    var stubbedSearchList: [SearchListEntity] = [
        SearchListEntity(searchKeyWord: "카카오"),
        SearchListEntity(searchKeyWord: "카페"),
        SearchListEntity(searchKeyWord: "카메라")
    ]
    
    // MARK: - 메서드 구현
    
    func insert(keyword: String) -> AnyPublisher<Void, Error> {
        didCallInsert = true
        insertedKeyword = keyword
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func delete(keyword: String) -> AnyPublisher<Void, Error> {
        didCallDelete = true
        deletedKeyword = keyword
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func deleteAll() -> AnyPublisher<Void, Error> {
        didCallDeleteAll = true
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func select(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        didCallSelect = true
        selectedKeyword = keyword
        let filtered = stubbedSearchList.filter { $0.searchKeyWord.contains(keyword) }
        return Just(filtered)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func selectAll() -> AnyPublisher<[SearchListEntity], Error> {
        didCallSelectAll = true
        return Just(stubbedSearchList)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func update(keyword: String) -> AnyPublisher<[SearchListEntity], Error> {
        didCallUpdate = true
        updatedKeyword = keyword
        return Just(stubbedSearchList)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
