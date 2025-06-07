//
//  SearchDetailListViewModel.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchDetailListViewModel: ObservableObject {
    @Published private(set) var searchDetailList: [SearchDetailEntity] = []
    @Published private(set) var isLoading: Bool = false

    let searchKeyword: String
    let useCase: SearchDetailListUseCaseProtocol
    var cancellables = Set<AnyCancellable>()

    init(useCase: SearchDetailListUseCaseProtocol, searchKeyword: String) {
        self.useCase = useCase
        self.searchKeyword = searchKeyword
        
        fetchSearchDetailList()
    }

    func fetchSearchDetailList() {
        isLoading = true
        
        useCase.searchDetailListUseCase(searchKeyword: searchKeyword)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    print("검색 실패: \(error)")
                }
            }, receiveValue: { [weak self] results in
                self?.searchDetailList = results
            })
            .store(in: &cancellables)
    }
}
