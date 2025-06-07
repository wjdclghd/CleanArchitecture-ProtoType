//
//  SearchDetailListUseCaseProtocol.swift
//  CleanArchitecture-ProtoType
//
//  Created by jch on 6/6/25.
//

import Foundation
import Combine

protocol SearchDetailListUseCaseProtocol{
    func searchDetailListUseCase(searchKeyword: String) -> AnyPublisher<[SearchDetailEntity], Error>
}
