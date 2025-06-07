//
//  SearchListViewModel.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/7/25.
//

import Foundation
import Combine

typealias SearchListViewModelProtocol = SearchListViewModelInput & SearchListViewModelOutput

final class SearchListViewModel: ObservableObject,
                                 SearchListViewModelProtocol {
    
    @Published private(set) var searchList: [SearchListEntity] = []
    @Published private(set) var isLoading: Bool = false
    @Published var selectedSearchKeyword: String? = nil
    
    var searchListPublisher: Published<[SearchListEntity]>.Publisher { $searchList }
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }
    
    // Input
    @Published var searchQuery: String = ""
    
    private let useCase: SearchListUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: SearchListUseCaseProtocol) {
        self.useCase = useCase
        
        $searchQuery
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.filterList()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Input Actions
    
    func filterList() {
        let trimmed = searchQuery.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {
            self.searchList = []
            return
        }
        
        isLoading = true
        useCase.select(searchKeyword: searchQuery)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print("필터링 실패:", error)
                }
            } receiveValue: { [weak self] results in
                self?.searchList = results
            }
            .store(in: &cancellables)
    }
    
    func saveKeyword(_ searchKeyword: String) {
        useCase.insert(searchKeyword: searchKeyword)
            .sink(receiveCompletion: { _ in }, receiveValue: { })
            .store(in: &cancellables)
    }
    
    func deleteKeyword(_ searchKeyword: String) {
        useCase.delete(searchKeyword: searchKeyword)
            .sink(receiveCompletion: { _ in }, receiveValue: { })
            .store(in: &cancellables)
    }
    
    func clearAllList() {
        useCase.deleteAll()
            .sink(receiveCompletion: { [weak self] _ in
                self?.searchList = []
            }, receiveValue: { })
            .store(in: &cancellables)
    }
    
    func loadAllList() {
        isLoading = true
        useCase.selectAll()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
            }, receiveValue: { [weak self] results in
                self?.searchList = results
            })
            .store(in: &cancellables)
    }
    
    func touchKeyword(_ searchKeyword: String) {
        useCase.update(searchKeyword: searchKeyword)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] updatedList in
                self?.searchList = updatedList
            })
            .store(in: &cancellables)
    }
}
