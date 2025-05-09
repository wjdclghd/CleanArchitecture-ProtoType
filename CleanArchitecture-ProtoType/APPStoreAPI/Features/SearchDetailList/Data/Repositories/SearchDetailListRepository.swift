//
//  SearchDetailListRepository.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 4/21/25.
//

import Foundation
import Combine

class SearchDetailListRepository: SearchDetailListInterface {
    init () {
        
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func searchDetailListInterface(completion: @escaping ([SearchDetailListEntity]) -> Void) {
        APIService.searchDetailList()
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("API : SearchDetailList Finished")
                case .failure(let error):
                    print("API Error : SearchDetailList \(error)")
                }
            }, receiveValue: {searchDetailList in
                completion(searchDetailList)
            })
            .store(in: &subscriptions)
    }
}
