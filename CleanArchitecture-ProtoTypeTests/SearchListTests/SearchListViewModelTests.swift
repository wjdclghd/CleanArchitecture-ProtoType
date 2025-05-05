//
//  SearchListViewModelTests.swift
//  CleanArchitecture-ProtoTypeTests
//
//  Created by 201510089 on 5/6/25.
//

@testable import CleanArchitecture_ProtoType

import Foundation
import XCTest
import Combine

final class SearchListViewModelTests: XCTestCase {
    
    var viewModel: SearchListViewModel!
    var useCase: MockSearchListUseCase!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        useCase = MockSearchListUseCase()
        viewModel = SearchListViewModel(useCase: useCase)
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        useCase = nil
        cancellables = nil
        super.tearDown()
    }
    
    func test_filterList_triggersSelectUseCase() {
        // given
        let expectation = XCTestExpectation(description: "searchList should be updated")
        
        // when
        viewModel.searchQuery = "카"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            // then
            XCTAssertTrue(self.useCase.didCallSelect)
            XCTAssertEqual(self.useCase.selectedKeyword, "카")
            XCTAssertEqual(self.viewModel.searchList.count, 3)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_saveKeyword_triggersInsertUseCase() {
        // when
        viewModel.saveKeyword("야놀자")
        
        // then
        XCTAssertTrue(useCase.didCallInsert)
        XCTAssertEqual(useCase.insertedKeyword, "야놀자")
    }

    func test_clearAllList_triggersDeleteAllUseCaseAndClearsList() {
        // given: 초기 리스트 로딩
        viewModel.loadAllList()
        
        let expectation = XCTestExpectation(description: "searchList should be empty after clearAll")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // when
            self.viewModel.clearAllList()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                // then
                XCTAssertTrue(self.useCase.didCallDeleteAll)
                XCTAssertEqual(self.viewModel.searchList.count, 0)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
