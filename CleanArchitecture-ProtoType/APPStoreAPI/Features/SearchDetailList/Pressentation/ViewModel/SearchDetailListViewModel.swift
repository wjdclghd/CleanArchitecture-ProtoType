//
//  SearchDetailListViewModel.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

final class SearchDetailListViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published private(set) var searchResults: [SearchDetailEntity] = []
    @Published private(set) var isLoading: Bool = false

    private let useCase: SearchDetailListUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(useCase: SearchDetailListUseCaseProtocol) {
        self.useCase = useCase
        bind()
    }

    private func bind() {
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] keyword in
                guard let self = self, !keyword.isEmpty else { return }
                self.fetchResults(for: keyword)
            }
            .store(in: &cancellables)
    }

    func fetchResults(for keyword: String) {
        isLoading = true
        useCase.searchDetailListUseCase(keyword: keyword)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    print("검색 실패: \(error)")
                }
            }, receiveValue: { [weak self] results in
                self?.searchResults = results
            })
            .store(in: &cancellables)
    }
}
